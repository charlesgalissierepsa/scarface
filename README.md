# Requins 🦈 — le jeu du fric entre potes

Jeu de société sur mobile : chacun part avec la même somme et tente de devenir le plus riche
(casino, bourse, crypto, immobilier, entreprises, startups… et quelques activités moins légales).

## Modes de jeu
- **En ligne** : un joueur crée un salon, les autres le rejoignent avec le code à 4 caractères
  (ou le lien partagé). Chacun joue sur son téléphone.
- **Sur un seul téléphone** : on se passe le téléphone à tour de rôle.

## Mise en ligne sur GitHub Pages
1. Crée un dépôt sur GitHub (par exemple `requins`).
2. Envoie-y les fichiers `index.html` et `mqtt.min.js` (bouton « Add file › Upload files »).
3. Dans le dépôt : **Settings › Pages › Build and deployment** : Source « Deploy from a branch »,
   branche `main`, dossier `/ (root)`, puis **Save**.
4. Après une minute, le jeu est disponible sur `https://<ton-pseudo>.github.io/requins/`.

## Comment marche le multijoueur
Il n'y a pas de serveur à installer : les téléphones communiquent via un relais MQTT public
gratuit (HiveMQ, avec EMQX et Mosquitto en secours). L'état de la partie est conservé sur le relais,
donc un joueur qui recharge la page ou perd le réseau peut revenir avec le bouton
« Revenir dans la partie ».

Ces relais sont publics : ne mets rien de confidentiel dans les pseudos.
