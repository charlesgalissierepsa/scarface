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
- **Seul contre l’ordinateur** : sans connexion, contre 1 à 5 adversaires. Chacun a un niveau (Facile, Moyen, Difficile) et un caractère tiré au sort (prudent, flambeur, mafieux, trader). Les ordinateurs jouent avec les mêmes règles que les humains, sans connaître l’avenir, et racontent leur tour à l’écran. Les parties en solo ne comptent pas dans la ligue.

## Les règles en bref
- **3 points d'action (PA) par tour.** Casino, trading, immobilier, startup, boulot ou coup bas : 1 PA.
  Créer une entreprise, monter un réseau de trafic ou braquer : 2 PA.
- **3 opportunités par tour**, tirées au hasard : yacht saisi, tuyau d'initié, commissaire corrompu, usurier…
- **Gratuit** : Bourse, banque, blanchiment, vente de ses biens.
- **Associé** : tous les 4 tours, chacun fait équipe avec un nouvel associé (Banquier, Parrain, Escroc, Flambeur,
  Trader, Promoteur) qui apporte un talent et un défaut pendant ces 4 tours.
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
- **Startups** : équipe, traction (parfois gonflée) et hype déterminent le prix d'entrée et la qualité cachée.
  Un audit révèle la vérité. À chaque tour la startup lève, stagne, plonge ou meurt ; on peut suivre ses levées
  ou revendre sa part (−20 %). Le moral de son secteur en Bourse compte.
- **Casinos à paliers** : six casinos, du Tripot (mise max 500 €) au Club des Milliardaires (1 M€). On débloque le
  suivant en cumulant, dans le casino actuel, des gains égaux à sa mise max. Les pertes ne comptent pas.
- **Après la partie** : revanche en un clic, ligue entre potes (classement cumulé sur le téléphone) et carte de fin
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
