# Scarface — The world is yours

Jeu de société sur mobile dans une ambiance néon années 80 : chacun part avec la même somme et tente
de devenir le plus riche (casino, bourse, crypto, immobilier, entreprises, startups… et beaucoup d'activités moins légales).

## Modes de jeu
- **En ligne** : un joueur crée un salon, les autres le rejoignent avec le code à 4 caractères
  (ou le lien partagé). Chacun joue sur son téléphone, et **tout le monde joue son tour en même temps** :
  braquages et coups bas compris. Les coups bas tombent en direct chez la victime. Quand on a fini, « Finir mon
  tour » affiche « En attente de x/x » ; la manche se ferme quand tout le monde a fini.
- **Parties publiques ou privées** : dans le salon, l'hôte choisit. Une partie publique apparaît dans « Rejoindre une
  partie » (« Partie de … »), il suffit de la toucher ; une partie privée ne se rejoint qu'avec le code.
- **Sur un seul téléphone** : on se passe le téléphone à tour de rôle.
- **Seul contre l’ordinateur** : sans connexion, contre 1 à 7 adversaires (jusqu'à 8 joueurs, en ligne et sur un téléphone aussi). Chacun a un niveau (Facile, Moyen, Difficile) et un caractère tiré au sort (prudent, flambeur, mafieux, trader). Les ordinateurs jouent avec les mêmes règles que les humains, sans connaître l’avenir, et racontent leur tour à l’écran.

## Comptes joueurs

La première page propose trois entrées :
- **Jouer en tant qu’invité** : un pseudo est attribué (SCAR-123456) et ne se modifie pas. Les statistiques sont gardées sur ce téléphone ; l’invité peut ensuite créer un vrai compte en les gardant.
- **S’inscrire** : pseudo unique (4 à 14 caractères), adresse email et mot de passe.
- **Se connecter** : avec le pseudo ou l’email, et le mot de passe.

Les parties en ligne et en solo comptent dans les statistiques du compte ; une partie à plusieurs sur un seul téléphone n’y compte pas. Un joueur inscrit peut changer son mot de passe dans les réglages.

Les comptes et les statistiques sont gérés par Supabase (projet « scarface »). La structure de la base est dans `supabase/migrations/` et la fonction de connexion par pseudo dans `supabase/functions/login/`. Sans réseau, on peut toujours jouer en invité, sans statistiques.

## Les règles en bref
- **3 points d'action (PA) par tour.** Casino, trading, immobilier, startup, boulot ou coup bas : 1 PA.
  Créer une entreprise, monter un réseau de trafic ou braquer : 2 PA.
- **3 opportunités par tour**, tirées au hasard : yacht saisi, tuyau d'initié, commissaire corrompu, usurier…
- **Gratuit** : Bourse, banque, blanchiment, vente de ses biens.
- **Associé** : tous les 4 tours, chacun fait équipe avec un nouvel associé (Banquier, Parrain, Escroc, Flambeur,
  Trader, Promoteur, Business Angel) qui apporte un talent et un défaut pendant ces 4 tours.
  Il est affiché en permanence sous ta fortune, et une carte l'annonce à chaque changement.
- **Durée** : en ligne, 15, 25 ou 40 tours (tout le monde joue en même temps) ; sur un seul téléphone, 8, 12 ou 20 tours.
- **Objectif secret** : un par joueur pour toute la partie, +15 % de patrimoine à la fin s'il est réussi.
- **Enchère de la manche** : un lot par tour, offre secrète et gratuite en PA, la plus haute gagne.
- **Rumeurs** : l'événement de fin de manche est annoncé à l'avance, mais une rumeur peut être fausse.
- **Gros coups** : machine à sous x500, grattage x10 000, cagnotte commune du casino, coup du siècle réservé au
  dernier (x8), opportunités légendaires (x10). Le gagnant d'un gros lot devient la cible de la manche suivante.
- **Contre l'emballement** : le premier attire la police et les coups bas contre lui coûtent moins cher ; la taille
  des opportunités dépend du patrimoine moyen ; la dernière manche se joue à l'aveugle.
- **Braquages** : chances de réussite modestes, préparation payée d'avance, réputation requise pour les grosses
  cibles, sécurité renforcée sur une cible déjà braquée. Un repérage (1 PA) donne +15 % au tour suivant.
- **Trading** : positions à la hausse ou à la baisse, levier x1 à x10, stop-loss et objectif de gain, qui restent
  ouvertes d'un tour à l'autre. Chaque actif traverse des phases cachées ; tendance, valorisation, avis des analystes
  et résultats trimestriels donnent des indices (bruités). Frais d'ouverture et de financement, exposition plafonnée.
- **Startups : un vivier commun** à tous les joueurs (6 à 10 startups, 1 à 4 nouvelles par tour). Chacune vit
  plusieurs tours : elle lève des fonds (Amorçage → Série A/B/C → Pré-IPO), se fait racheter, entre en Bourse ou
  ferme quand sa **trésorerie** est vide (on le voit venir : « ≈ 2 tours »). Son sort dépend d'indicateurs, pas d'un
  seul dé : potentiel caché (révélé par l'**audit**), équipe, produit, ventes/dépenses, buzz, moral du secteur,
  stratégie, et de ce que font les joueurs.
  - **Entrer** : souscrire à une levée (ordre clos en fin de tour ; les fonds du jeu suivent si elle est attirante ;
    il faut 70 % de l'objectif, sinon remboursement ; trop de demande = prorata), ou racheter des parts à un fonds
    (+15 %, 10 % max par tour). Levée « de survie » en baisse = bonnes affaires risquées.
  - **Conseil d'administration** (10 % du capital, ou 1er actionnaire joueur avec 5 %) : vote de la stratégie au
    poids des parts (équilibrée, croissance agressive, rentabilité, chercher un acheteur, pivoter), vote des offres
    de rachat, recrutement d'un dirigeant (équipe +1, dépenses +12 %).
  - **Aider** : mentorat (1 PA, produit/équipe/croissance), prêt relais (converti en parts −30 % à la levée suivante,
    ×1,5 si rachat, perdu si faillite), synergie avec tes entreprises du même domaine.
  - **Sortir** : rachat, introduction en Bourse, ou revente à 75 % de la valeur (40 % en pleine crise).
  - En ligne, chaque joueur ne modifie que sa fiche (ordres, votes, mentorat) ; l'hôte applique tout en fin de manche.
- **Casinos à paliers** : six casinos, du Tripot (mise max 500 €) au Club des Milliardaires (1 M€). On débloque le
  suivant en cumulant, dans le casino actuel, des gains égaux à sa mise max. Les pertes ne comptent pas.
- **Après la partie** : revanche en un clic et carte de fin
  à partager dans le groupe.
- **Duel au poker** (coup bas) : une main de Texas Hold'em à mise égale, affichée en direct sur les deux écrans ;
  la meilleure main de 5 cartes parmi 7 rafle le pot.
- **Argent sale** (braquages, trafic) : compté à 50 % dans le patrimoine, il attire la police et il est saisi en
  cas d'arrestation. On le blanchit via ses commerces (10 % de frais) ou chez le blanchisseur (30 %).
- Le plus gros **patrimoine net** à la fin gagne.

## Mise en ligne
Le jeu est publié sur GitHub Pages depuis la branche `main`. Pour publier une modification :

```
git add -A
git commit -m "ce que j'ai changé"
git push
```

Le site se met à jour en une à deux minutes.

## Comment marche le multijoueur
Il n'y a pas de serveur à installer : les téléphones communiquent via un relais MQTT public
gratuit (HiveMQ, avec EMQX et Mosquitto en secours). L'état de la partie est conservé sur le relais,
donc un joueur qui recharge la page ou perd le réseau peut revenir avec le bouton
« Revenir dans la partie ».

Ces relais sont publics : ne mets rien de confidentiel dans les pseudos.

## Crédits

Icônes : tracés [Phosphor Icons](https://phosphoricons.com) (licence MIT), habillés en tuiles 3D néon pour le jeu.
