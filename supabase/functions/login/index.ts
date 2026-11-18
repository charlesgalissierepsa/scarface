// Fonction Supabase « login » (déployée sur le projet scarface, sans vérification JWT : elle sert avant la connexion).
// Connexion avec le pseudo OU l'email + le mot de passe.
// Supabase Auth ne connaît que l'email : on retrouve l'email du pseudo côté serveur (jamais renvoyé au client),
// puis on ouvre la session avec le mot de passe et on renvoie les jetons de session.
import { createClient } from "npm:@supabase/supabase-js@2";

const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};
const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), { status, headers: { ...cors, "Content-Type": "application/json" } });

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  if (req.method !== "POST") return json({ error: "method_not_allowed" }, 405);
  let body: { identifier?: unknown; password?: unknown };
  try { body = await req.json(); } catch { return json({ error: "bad_request" }, 400); }
  const id = String(body.identifier ?? "").trim();
  const password = String(body.password ?? "");
  if (!id || !password || id.length > 254 || password.length > 200) return json({ error: "invalid_credentials" }, 400);

  const url = Deno.env.get("SUPABASE_URL")!;
  const service = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const anon = Deno.env.get("SUPABASE_ANON_KEY")!;
  let email = id;
  if (!id.includes("@")) {
    const admin = createClient(url, service, { auth: { persistSession: false, autoRefreshToken: false } });
    const pattern = id.replace(/[\\%_]/g, (c) => "\\" + c);
    const { data: prof } = await admin.from("profiles").select("id").ilike("username", pattern).eq("is_guest", false).maybeSingle();
    if (!prof) return json({ error: "invalid_credentials" }, 401);
    const { data: u } = await admin.auth.admin.getUserById(prof.id);
    if (!u?.user?.email) return json({ error: "invalid_credentials" }, 401);
    email = u.user.email;
  }
  const pub = createClient(url, anon, { auth: { persistSession: false, autoRefreshToken: false } });
  const { data, error } = await pub.auth.signInWithPassword({ email, password });
  if (error || !data.session) return json({ error: error?.status === 429 ? "rate_limited" : "invalid_credentials" }, error?.status === 429 ? 429 : 401);
  return json({ access_token: data.session.access_token, refresh_token: data.session.refresh_token });
});
