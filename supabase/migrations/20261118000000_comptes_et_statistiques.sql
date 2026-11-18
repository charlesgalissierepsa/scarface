-- Comptes Scarface (projet Supabase « scarface », organisation gamecreation's Org).
-- Déjà appliquée sur le projet : ce fichier sert de référence. Un profil par utilisateur (inscrit ou invité
-- anonyme) et les résultats des parties.
create schema if not exists private;

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  username text not null,
  avatar text not null default '🕶️',
  is_guest boolean not null default false,
  created_at timestamptz not null default now(),
  -- 4 à 14 caractères : lettres (accents compris), chiffres, tiret, point, souligné
  constraint profiles_username_format check (username ~ '^[[:alnum:]_.-]{4,14}$'),
  -- le motif des pseudos d'invités (SCAR-123456) leur est réservé
  constraint profiles_guest_pattern check (is_guest or username !~* '^scar-[0-9]+$'),
  constraint profiles_avatar_len check (char_length(avatar) <= 16)
);
-- pseudo unique sans tenir compte des majuscules
create unique index profiles_username_lower_key on public.profiles (lower(username));

create table public.game_results (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  game_id text not null,
  mode text not null check (mode in ('solo', 'local', 'online')),
  rank smallint not null check (rank between 1 and 6),
  players smallint not null check (players between 1 and 6),
  rounds smallint not null check (rounds between 1 and 60),
  net_worth bigint not null,
  details jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  constraint game_results_once unique (user_id, game_id)
);
create index game_results_user_created_idx on public.game_results (user_id, created_at desc);

-- Statistiques par joueur (vue lue avec les droits de l'appelant)
create view public.player_stats with (security_invoker = true) as
select p.id, p.username, p.avatar, p.is_guest,
  count(r.id)::int as games,
  count(r.id) filter (where r.rank = 1)::int as wins,
  coalesce(max(r.net_worth), 0)::bigint as best_net_worth,
  round(avg(r.rank), 2) as avg_rank,
  max(r.created_at) as last_game
from public.profiles p
left join public.game_results r on r.user_id = p.id
group by p.id;

alter table public.profiles enable row level security;
alter table public.game_results enable row level security;

-- Pseudos, avatars et résultats sont publics (classements) ; chacun n'écrit que les siens.
create policy profiles_read on public.profiles for select to anon, authenticated using (true);
create policy profiles_update_own on public.profiles for update to authenticated
  using ((select auth.uid()) = id) with check ((select auth.uid()) = id);
create policy results_read on public.game_results for select to anon, authenticated using (true);
create policy results_insert_own on public.game_results for insert to authenticated
  with check ((select auth.uid()) = user_id);

-- Seul l'avatar se modifie directement ; le pseudo passe par claim_username.
revoke update on public.profiles from anon, authenticated;
grant update (avatar) on public.profiles to authenticated;
revoke insert, update, delete on public.game_results from anon;
revoke update, delete on public.game_results from authenticated;

-- Création automatique du profil à la création du compte (pseudo choisi, ou SCAR-xxxxxx pour un invité).
create or replace function private.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_name text := nullif(trim(new.raw_user_meta_data ->> 'username'), '');
  v_av text := coalesce(nullif(new.raw_user_meta_data ->> 'avatar', ''), '🕶️');
  v_guest boolean := coalesce(new.is_anonymous, false) or v_name is null;
begin
  if char_length(v_av) > 16 then v_av := '🕶️'; end if;
  if v_guest then
    loop
      v_name := 'SCAR-' || lpad((floor(random() * 1000000))::int::text, 6, '0');
      exit when not exists (select 1 from public.profiles where lower(username) = lower(v_name));
    end loop;
  end if;
  insert into public.profiles (id, username, avatar, is_guest) values (new.id, v_name, v_av, v_guest);
  return new;
end;
$$;
revoke execute on function private.handle_new_user() from public, anon, authenticated;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function private.handle_new_user();

-- Le pseudo est-il libre ? (appelé pendant l'inscription, avant toute connexion : public exprès)
create or replace function public.username_available(p_name text)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select trim(p_name) ~ '^[[:alnum:]_.-]{4,14}$'
     and trim(p_name) !~* '^scar-[0-9]+$'
     and not exists (select 1 from public.profiles where lower(username) = lower(trim(p_name)));
$$;
grant execute on function public.username_available(text) to anon, authenticated;

-- Un invité qui crée son compte (email + mot de passe ajoutés) choisit son pseudo et garde ses statistiques.
create or replace function public.claim_username(p_name text)
returns text
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_uid uuid := (select auth.uid());
  v_name text := trim(p_name);
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if not exists (select 1 from public.profiles where id = v_uid and is_guest) then raise exception 'not_a_guest'; end if;
  if not exists (select 1 from auth.users where id = v_uid and email is not null) then raise exception 'email_required'; end if;
  if not public.username_available(v_name) then raise exception 'username_taken'; end if;
  update public.profiles set username = v_name, is_guest = false where id = v_uid;
  return v_name;
end;
$$;
revoke execute on function public.claim_username(text) from public, anon;
grant execute on function public.claim_username(text) to authenticated;
