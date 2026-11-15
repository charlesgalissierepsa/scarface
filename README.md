# Scarface 🌴 — le jeu du fric entre potes

Jeu de société sur mobile dans une ambiance néon années 80 : chacun part avec la même somme et tente
de devenir le plus riche (casino, bourse, crypto, immobilier, entreprises, startups… et beaucoup d'activités moins légales).

## Modes de jeu
- **En ligne** : un joueur crée un salon, les autres le rejoignent avec le code à 4 caractères
  (ou le lien partagé). Chacun joue sur son téléphone.
- **Sur un seul téléphone** : on se passe le téléphone à tour de rôle.

## Les règles en bref
- **3 points d'action (PA) par tour.** Casino, trading, immobilier, startup, boulot ou coup bas : 1 PA.
  Créer une entreprise ou monter un réseau de trafic : 2 PA. Un braquage : 3 PA (tout le tour).
- **3 opportunités par tour**, tirées au hasard : yacht saisi, tuyau d'initié, commissaire corrompu, usurier…
- **Gratuit** : Bourse, banque, blanchiment, vente de ses biens.
- **Braquages** : chances de réussite basses, préparation payée d'avance, réputation requise pour les grosses
  cibles, sécurité renforcée sur une cible déjà braquée. Un repérage (1 PA) donne +15 % au tour suivant.
- **Trading** : positions à la hausse ou à la baisse, levier x1 à x10, stop-loss et objectif de gain, qui restent
  ouvertes d'un tour à l'autre. Chaque actif traverse des phases cachées ; tendance, valorisation, avis des analystes
  et résultats trimestriels donnent des indices (bruités). Frais d'ouverture et de financement, exposition plafonnée.
- **Startups** : équipe, traction (parfois gonflée) et hype déterminent le prix d'entrée et la qualité cachée.
  Un audit révèle la vérité. À chaque tour la startup lève, stagne, plonge ou meurt ; on peut suivre ses levées
  ou revendre sa part (−20 %). Le moral de son secteur en Bourse compte.
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
