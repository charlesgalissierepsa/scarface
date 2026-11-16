# Audit du design de Scarface

Inventaire automatique de `index.html` avant la refonte : feuille de style et attributs `style` écrits dans le JavaScript. Les valeurs sont comptées telles qu'elles apparaissent dans le code.

- Lignes de CSS : 373
- Attributs `style` en ligne dans le JS : 124
- Animations `@keyframes` : 14 (twinkle, sunrise, gridrun, shine, flicker, pulse, livepulse, deal, blur, flip, tin, pop, shake, bounce)

## Incohérences relevées

1. **Deux couches de CSS qui se contredisent.** La feuille de base (angles arrondis de 9 à 22 px, verre dépoli, halos) est écrasée par un bloc « peau années 80 » ajouté à la fin (angles à 0, liserés en dégradé, ombres décalées). Une grande partie des déclarations de la première couche est donc morte, et chaque composant a deux définitions.
2. **Quatre familles de polices** (Monoton, Audiowide, Kaushan Script, Figtree) pour trois rôles. Audiowide sert à la fois aux titres, aux boutons, aux libellés, au cash et aux montants saisis.
3. **38 tailles de police**, dont beaucoup sont presque identiques : 11, 12 et 13 px ; 19, 20 et 21 px ; 24, 26 et 28 px. Les graisses vont de 400 à 900 sans règle.
4. **18 valeurs de `border-radius`** (9, 10, 11, 12, 13, 14, 16, 18, 22, 24, 99 px…), presque toutes annulées ensuite par la deuxième couche.
5. **62 `box-shadow` différents.** Halos flous sur la carte du joueur, les cases, les boutons, les toasts, les résultats, les cartes plein écran : plusieurs éléments lumineux se concurrencent sur chaque écran. Les ombres décalées ont quatre tailles (3, 4, 5, 6, 7, 9, 10 px).
6. **`text-shadow` lumineux sur du texte courant** : libellés de section, titres de feuilles, nom du joueur sur l'écran de passage, slogan.
7. **Surfaces semi-transparentes et verre dépoli** (`backdrop-filter: blur`) sur les panneaux, cases, lignes, opportunités, comptes du journal : le décor transparaît sous le texte, et le flou coûte cher au défilement.
8. **Cinq variantes de bouton** (`.btn`, `.red`, `.green`, `.ghost`, `.sm`) plus trois dégradés roses recopiés pour les onglets, les choix segmentés et les pastilles. Le bouton vert sert aussi bien à acheter, blanchir qu'à clôturer une position gagnante. Plusieurs boutons principaux roses sont visibles en même temps (opportunités, biens, startups).
9. **Quatre formes pour un message** : `.note`, `.note.warn`, `.err`, `.result`, avec des bordures, fonds et épaisseurs différents.
10. **Listes en piles de cartes encadrées** partout, y compris pour des listes simples (Bourse, classement, comptes).
11. **Animations permanentes nombreuses** : étoiles, soleil, grille, reflet des boutons, grésillement du logo, pulsation d'avatar, pulsation du casino. Trois d'entre elles animent des propriétés coûteuses : `background-position` (grille), `left` (reflet), `box-shadow` (pulsations).
12. **124 attributs `style` écrits en dur dans le JavaScript** (marges, tailles, couleurs).
13. **57 emploi d'emoji comme décor d'interface** (titres de feuilles, boutons, toasts, résumés) et des icônes d'interface en emoji (⚙️, 🏆, ✕, ←, 🔒).
14. **Hauteurs en `vh`**, qui sautent quand la barre d'adresse mobile apparaît.
15. **Rendu complet de l'écran** (`innerHTML` de toute l'app) à chaque changement d'état, y compris toutes les 4 secondes en ligne : le défilement et la saisie en cours peuvent être perdus.

## Couleurs

### Couleurs (hex et rgba)

| Valeur | Occurrences |
| --- | --- |
| `#fff` | 17 |
| `rgba(0,0,0,.6)` | 7 |
| `#000` | 6 |
| `#12032b` | 6 |
| `rgba(13,2,33,.7)` | 6 |
| `rgba(25,230,255,.12)` | 6 |
| `rgba(25,230,255,.45)` | 6 |
| `rgba(255,42,138,.35)` | 6 |
| `#bda7da` | 5 |
| `#ff2a8a` | 5 |
| `rgba(255,42,138,.45)` | 5 |
| `rgba(255,42,138,.5)` | 5 |
| `#1f0b2e` | 4 |
| `#39ff9c` | 4 |
| `#ff3b5c` | 4 |
| `#ffd23f` | 4 |
| `rgba(0,0,0,.45)` | 4 |
| `rgba(25,230,255,.3)` | 4 |
| `rgba(255,255,255,.08)` | 4 |
| `rgba(255,42,138,.6)` | 4 |
| `#0d0221` | 3 |
| `#19e6ff` | 3 |
| `#2a0a55` | 3 |
| `#b26bff` | 3 |
| `#b80f62` | 3 |
| `#ff8a3d` | 3 |
| `#ff8cc4` | 3 |
| `#ffd6f0` | 3 |
| `#fff7fd` | 3 |
| `rgba(0,0,0,.35)` | 3 |
| `rgba(0,0,0,.4)` | 3 |
| `rgba(0,0,0,.5)` | 3 |
| `rgba(13,2,33,.75)` | 3 |
| `rgba(25,230,255,.35)` | 3 |
| `rgba(255,42,138,.12)` | 3 |
| `rgba(5,0,15,.65)` | 3 |
| `#3b0c6e` | 2 |
| `#b8b8c8` | 2 |
| `#c4127a` | 2 |
| `#c9ff5c` | 2 |
| `#d6d6e2` | 2 |
| `#ff4f8b` | 2 |
| `#ff5c7f` | 2 |
| `#ff9aae` | 2 |
| `rgba(178,107,255,.35)` | 2 |
| `rgba(25,230,255,.14)` | 2 |
| `rgba(25,230,255,.4)` | 2 |
| `rgba(255,210,63,.16)` | 2 |
| `rgba(255,210,63,.55)` | 2 |
| `rgba(255,210,63,.7)` | 2 |
| `rgba(255,255,255,.06)` | 2 |
| `rgba(255,255,255,.1)` | 2 |
| `rgba(255,255,255,.2)` | 2 |
| `rgba(255,255,255,.3)` | 2 |
| `rgba(255,42,138,.18)` | 2 |
| `rgba(255,42,138,.2)` | 2 |
| `rgba(255,42,138,.55)` | 2 |
| `rgba(255,42,138,.9)` | 2 |
| `rgba(255,59,92,.4)` | 2 |
| `rgba(255,59,92,.6)` | 2 |
| `rgba(28,7,58,.8)` | 2 |
| `rgba(5,0,15,.55)` | 2 |
| `rgba(5,0,15,.7)` | 2 |
| `#04121c` | 1 |
| `#0a011c` | 1 |
| `#0a8a4e` | 1 |
| `#0a8fb0` | 1 |
| `#0b0614` | 1 |
| `#0b7a4b` | 1 |
| `#1a1a1a` | 1 |
| `#1b0640` | 1 |
| `#1d0544` | 1 |
| `#1fd8e8` | 1 |
| `#22084a` | 1 |
| `#25074a` | 1 |
| `#2a0a10` | 1 |
| `#2a6fd6` | 1 |
| `#333` | 1 |
| `#3a2a4a` | 1 |
| `#4b0c63` | 1 |
| `#4dffb0` | 1 |
| `#6b5f7a` | 1 |
| `#86145f` | 1 |
| `#9b1269` | 1 |
| `#9e0c32` | 1 |
| `#a3123a` | 1 |
| `#c4123a` | 1 |
| `#c8f7ff` | 1 |
| `#c9fbff` | 1 |
| `#d4145a` | 1 |
| `#e0245a` | 1 |
| `#fdf0ff` | 1 |
| `#ff79c6` | 1 |
| `#ff8fa3` | 1 |
| `#ff9aac` | 1 |
| `#ffb03b` | 1 |
| `#ffc2d8` | 1 |
| `#ffe96b` | 1 |
| `#ffe98a` | 1 |
| `#fff4f9` | 1 |
| `#fff5fb` | 1 |
| `rgba(0,0,0,.2)` | 1 |
| `rgba(13,2,33,.55)` | 1 |
| `rgba(13,2,33,.88)` | 1 |
| `rgba(13,2,33,.97)` | 1 |
| `rgba(18,3,43,.96)` | 1 |
| `rgba(201,255,92,.3)` | 1 |
| `rgba(201,255,92,.35)` | 1 |
| `rgba(201,255,92,.6)` | 1 |
| `rgba(25,230,255,.08)` | 1 |
| `rgba(25,230,255,.15)` | 1 |
| `rgba(25,230,255,.16)` | 1 |
| `rgba(25,230,255,.2)` | 1 |
| `rgba(25,230,255,.22)` | 1 |
| `rgba(25,230,255,.5)` | 1 |
| `rgba(253,240,255,.12)` | 1 |
| `rgba(255,138,61,.2)` | 1 |
| `rgba(255,138,61,.35)` | 1 |
| `rgba(255,138,61,.45)` | 1 |
| `rgba(255,210,63,.1)` | 1 |
| `rgba(255,210,63,.18)` | 1 |
| `rgba(255,210,63,.22)` | 1 |
| `rgba(255,210,63,.35)` | 1 |
| `rgba(255,210,63,.4)` | 1 |
| `rgba(255,210,63,.45)` | 1 |
| `rgba(255,210,63,.8)` | 1 |
| `rgba(255,255,255,.15)` | 1 |
| `rgba(255,255,255,.22)` | 1 |
| `rgba(255,255,255,.35)` | 1 |
| `rgba(255,42,138,.08)` | 1 |
| `rgba(255,42,138,.1)` | 1 |
| `rgba(255,42,138,.3)` | 1 |
| `rgba(255,59,92,.1)` | 1 |
| `rgba(255,59,92,.14)` | 1 |
| `rgba(255,59,92,.2)` | 1 |
| `rgba(255,59,92,.55)` | 1 |
| `rgba(255,59,92,.7)` | 1 |
| `rgba(255,79,139,.55)` | 1 |
| `rgba(28,7,58,.72)` | 1 |
| `rgba(45,10,90,.85)` | 1 |
| `rgba(5,0,15,.5)` | 1 |
| `rgba(5,0,15,.6)` | 1 |
| `rgba(5,0,15,.82)` | 1 |
| `rgba(57,255,156,.1)` | 1 |
| `rgba(57,255,156,.15)` | 1 |
| `rgba(57,255,156,.2)` | 1 |
| `rgba(57,255,156,.4)` | 1 |
| `rgba(57,255,156,.6)` | 1 |
| `rgba(8,1,22,.55)` | 1 |

### Dégradés

| Type | Occurrences |
| --- | --- |
| `linear-gradient` | 48 |
| `radial-gradient` | 14 |
| `repeating-linear-gradient` | 7 |

## Typographie

### Familles

| Valeur | Occurrences |
| --- | --- |
| `var(--display)` | 24 |
| `var(--script)` | 2 |
| `var(--body)` | 1 |
| `var(--display) font-weight:800 width:100%` | 1 |
| `var(--logo)` | 1 |

### Tailles de police

| Valeur | Occurrences |
| --- | --- |
| `13px` | 11 |
| `11px` | 10 |
| `14px` | 10 |
| `12px` | 4 |
| `24px` | 4 |
| `28px` | 4 |
| `19px` | 3 |
| `26px` | 3 |
| `30px` | 3 |
| `10px` | 2 |
| `16px` | 2 |
| `17px` | 2 |
| `18px` | 2 |
| `21px` | 2 |
| `22px` | 2 |
| `34px` | 2 |
| `44px` | 2 |
| `46px` | 2 |
| `12.5px` | 1 |
| `15px` | 1 |
| `18px margin-top:14px margin-top:10px font-size:34px flex:1 font-family:var(--display)` | 1 |
| `20px` | 1 |
| `20px font-size:40px margin-top:26px --c:${p.color` | 1 |
| `21px --c:${f.c` | 1 |
| `21px margin-top:10px pointer-events:none margin:0 0 0 6px --c:${p.color` | 1 |
| `22px font-size:20px margin-top:12px font-family:var(--display)` | 1 |
| `32px` | 1 |
| `36px` | 1 |
| `38px` | 1 |
| `40px font-size:18px padding:12px` | 1 |
| `42px` | 1 |
| `50px` | 1 |
| `56px` | 1 |
| `60px font-size:22px margin-top:6px justify-content:center` | 1 |
| `64px` | 1 |
| `72px` | 1 |
| `clamp(30px,10vw,44px) --c:${p.color` | 1 |
| `clamp(32px,calc((100vw - 44px)/6.6),66px)` | 1 |

### Graisses

| Valeur | Occurrences |
| --- | --- |
| `700` | 12 |
| `800` | 8 |
| `600` | 5 |
| `400` | 3 |
| `400 margin:10px 0` | 1 |
| `400 width:100%` | 1 |
| `500` | 1 |
| `800 pointer-events:none margin:0 0 0 6px font-size:clamp(30px,10vw,44px) --c:${p.color` | 1 |
| `800 width:100%` | 1 |
| `900` | 1 |

### Interlignages

| Valeur | Occurrences |
| --- | --- |
| `1` | 6 |
| `1.2` | 2 |
| `1.1` | 1 |
| `1.15` | 1 |
| `1.4` | 1 |

### Espacement des lettres

| Valeur | Occurrences |
| --- | --- |
| `.08em` | 2 |
| `0` | 2 |
| `.01em` | 1 |
| `.06em` | 1 |
| `.18em` | 1 |
| `.22em` | 1 |
| `.25em` | 1 |
| `.2em` | 1 |
| `.35em` | 1 |
| `.3em` | 1 |

## Angles, ombres, filtres

### border-radius

| Valeur | Occurrences |
| --- | --- |
| `14px` | 8 |
| `50%` | 8 |
| `12px` | 7 |
| `16px` | 4 |
| `18px` | 4 |
| `99px` | 4 |
| `9px` | 3 |
| `0` | 2 |
| `10px` | 2 |
| `11px` | 2 |
| `13px` | 2 |
| `12px 12px 0 0` | 1 |
| `22px` | 1 |
| `24px` | 1 |
| `24px 24px 0 0` | 1 |
| `3px` | 1 |
| `6px` | 1 |
| `8px` | 1 |

### box-shadow

| Valeur | Occurrences |
| --- | --- |
| `none` | 6 |
| `0 0 18px rgba(25,230,255,.3)` | 2 |
| `0 -2px 0 var(--gold),0 -5px 0 var(--orange),0 -8px 0 var(--pink),0 -20px 50px rgba(0,0,0,.6)` | 1 |
| `0 -6px 30px rgba(255,42,138,.35),0 -20px 50px rgba(0,0,0,.6)` | 1 |
| `0 0 0 1px var(--c),0 0 26px color-mix(in srgb,var(--c) 45%,transparent)` | 1 |
| `0 0 0 1px var(--c),7px 7px 0 color-mix(in srgb,var(--c) 40%,transparent)` | 1 |
| `0 0 0 1px var(--pink),0 0 16px rgba(255,42,138,.35)` | 1 |
| `0 0 0 2px var(--c,var(--pink)),0 0 14px var(--c,var(--pink))` | 1 |
| `0 0 0 2px var(--cyan),0 0 40px rgba(25,230,255,.45),0 30px 80px rgba(0,0,0,.6)` | 1 |
| `0 0 0 2px var(--cyan),9px 9px 0 rgba(255,42,138,.55),0 30px 80px rgba(0,0,0,.6)` | 1 |
| `0 0 0 2px var(--gold),0 0 22px rgba(255,210,63,.55)` | 1 |
| `0 0 0 2px var(--gold),0 0 34px rgba(255,210,63,.8)` | 1 |
| `0 0 0 2px var(--pink),0 0 40px rgba(255,42,138,.55),0 30px 80px rgba(0,0,0,.6)` | 1 |
| `0 0 0 2px var(--pink),9px 9px 0 rgba(25,230,255,.45),0 30px 80px rgba(0,0,0,.6)` | 1 |
| `0 0 0 3px var(--c),0 0 40px var(--c),inset 0 0 30px var(--c)` | 1 |
| `0 0 0 3px var(--c),0 0 80px var(--c),inset 0 0 40px var(--c)` | 1 |
| `0 0 0 3px var(--pink),0 0 40px rgba(255,42,138,.45),0 20px 40px rgba(0,0,0,.5)` | 1 |
| `0 0 0 3px var(--pink),10px 10px 0 rgba(25,230,255,.35)` | 1 |
| `0 0 0 6px #2a0a55,0 0 0 9px var(--pink),0 0 30px var(--pink),inset 0 0 30px rgba(0,0,0,.6)` | 1 |
| `0 0 10px var(--cyan)` | 1 |
| `0 0 10px var(--pink)` | 1 |
| `0 0 12px rgba(25,230,255,.35),0 4px 10px rgba(0,0,0,.4)` | 1 |
| `0 0 12px rgba(255,42,138,.5)` | 1 |
| `0 0 12px var(--pink),0 0 30px var(--pink)` | 1 |
| `0 0 14px rgba(201,255,92,.3)` | 1 |
| `0 0 14px rgba(255,42,138,.5)` | 1 |
| `0 0 18px rgba(25,230,255,.4),0 10px 30px rgba(0,0,0,.5)` | 1 |
| `0 0 18px rgba(255,42,138,.5),0 10px 30px rgba(0,0,0,.5)` | 1 |
| `0 0 18px rgba(57,255,156,.2)` | 1 |
| `0 0 20px rgba(25,230,255,.45)` | 1 |
| `0 0 20px rgba(255,42,138,.45)` | 1 |
| `0 0 22px rgba(255,42,138,.35)` | 1 |
| `0 0 24px rgba(255,210,63,.55)` | 1 |
| `0 0 60px rgba(255,79,139,.55),0 0 140px rgba(255,138,61,.35)` | 1 |
| `0 0 8px var(--pink)` | 1 |
| `0 0 8px var(--win)` | 1 |
| `3px 3px 0 rgba(201,255,92,.35)` | 1 |
| `3px 3px 0 rgba(25,230,255,.12)` | 1 |
| `3px 3px 0 rgba(25,230,255,.2)` | 1 |
| `4px 4px 0 rgba(25,230,255,.12)` | 1 |
| `4px 4px 0 rgba(25,230,255,.3)` | 1 |
| `4px 4px 0 rgba(255,210,63,.18)` | 1 |
| `4px 4px 0 rgba(255,42,138,.18)` | 1 |
| `4px 4px 0 rgba(255,42,138,.35)` | 1 |
| `4px 4px 0 rgba(255,42,138,.45)` | 1 |
| `5px 5px 0 rgba(25,230,255,.16)` | 1 |
| `5px 5px 0 rgba(25,230,255,.4)` | 1 |
| `5px 5px 0 rgba(255,210,63,.45)` | 1 |
| `5px 5px 0 rgba(255,42,138,.2)` | 1 |
| `5px 5px 0 rgba(255,42,138,.5)` | 1 |
| `6px 6px 0 rgba(255,42,138,.35)` | 1 |
| `inset 0 0 0 1px rgba(255,255,255,.15)` | 1 |
| `inset 0 0 0 1px rgba(255,255,255,.2),0 0 18px rgba(255,59,92,.55),0 8px 24px rgba(0,0,0,.45)` | 1 |
| `inset 0 0 0 1px rgba(255,255,255,.22),0 0 18px rgba(255,42,138,.5),0 8px 24px rgba(0,0,0,.45)` | 1 |
| `inset 0 0 0 1px rgba(255,255,255,.3),0 0 18px rgba(25,230,255,.45),0 8px 24px rgba(0,0,0,.45)` | 1 |
| `inset 0 0 0 1px var(--line),0 0 12px rgba(25,230,255,.12)` | 1 |
| `inset 0 0 0 2px var(--pink),0 0 24px rgba(255,42,138,.45)` | 1 |
| `inset 0 0 18px rgba(25,230,255,.08)` | 1 |
| `inset 0 0 18px rgba(25,230,255,.15),0 0 16px rgba(25,230,255,.35)` | 1 |
| `inset 0 0 18px rgba(255,42,138,.12)` | 1 |
| `inset 0 0 18px rgba(255,42,138,.2),0 0 16px rgba(255,42,138,.45)` | 1 |
| `inset 0 8px 14px rgba(0,0,0,.35)` | 1 |

### text-shadow

| Valeur | Occurrences |
| --- | --- |
| `none` | 3 |
| `0 0 10px currentColor,0 0 30px currentColor,0 4px 0 rgba(0,0,0,.4)` | 1 |
| `0 0 10px rgba(0,0,0,.4)` | 1 |
| `0 0 10px rgba(255,210,63,.7),0 0 26px rgba(255,138,61,.45)` | 1 |
| `0 0 10px rgba(255,42,138,.6)` | 1 |
| `0 0 10px var(--cyan),0 0 30px var(--cyan)` | 1 |
| `0 0 12px rgba(255,42,138,.6)` | 1 |
| `0 0 12px rgba(255,59,92,.6)` | 1 |
| `0 0 12px rgba(255,59,92,.7)` | 1 |
| `0 0 12px rgba(57,255,156,.6)` | 1 |
| `0 0 14px var(--c)` | 1 |
| `0 0 14px var(--gold) flex:1 max-width:448px` | 1 |
| `0 0 3px #fff,0 0 10px var(--pink),0 0 24px var(--pink),0 0 48px var(--pink),0 0 80px rgba(255,42,138,.6)` | 1 |
| `0 0 6px var(--cyan)` | 1 |
| `0 0 6px var(--cyan),0 0 20px var(--cyan)` | 1 |
| `0 0 6px var(--pink)` | 1 |
| `0 0 8px rgba(25,230,255,.5)` | 1 |
| `0 0 8px rgba(255,210,63,.7)` | 1 |
| `0 0 8px var(--pink)` | 1 |
| `0 1px 2px rgba(0,0,0,.35)` | 1 |
| `0 2px 0 rgba(0,0,0,.2)` | 1 |

### filter

| Valeur | Occurrences |
| --- | --- |
| `blur(1px)` | 1 |
| `blur(40px)` | 1 |
| `drop-shadow(0 0 14px rgba(255,255,255,.3))` | 1 |
| `drop-shadow(0 0 8px rgba(25,230,255,.45))` | 1 |
| `drop-shadow(0 0 8px rgba(255,42,138,.6))` | 1 |
| `saturate(.4)` | 1 |

### backdrop-filter

| Valeur | Occurrences |
| --- | --- |
| `blur(6px)` | 8 |
| `blur(8px)` | 6 |

## Espacements

### padding

| Valeur | Occurrences |
| --- | --- |
| `10px 12px` | 4 |
| `12px` | 4 |
| `12px 14px` | 3 |
| `14px` | 3 |
| `18px` | 3 |
| `10px 0 --c:${t.color` | 2 |
| `10px 4px` | 2 |
| `16px` | 2 |
| `24px` | 2 |
| `28px` | 2 |
| `4px` | 2 |
| `6px 16px` | 2 |
| `8px 0` | 2 |
| `0 0 14px` | 1 |
| `10px 12px 6px` | 1 |
| `10px 12px margin-top:12px margin:14px 0 6px font-size:40px font-size:18px padding:12px` | 1 |
| `10px 14px` | 1 |
| `11px 4px` | 1 |
| `12px 16px` | 1 |
| `12px 16px calc(env(safe-area-inset-bottom) + 14px)` | 1 |
| `12px 6px 10px` | 1 |
| `12px justify-content:space-between` | 1 |
| `13px 14px` | 1 |
| `15px 18px` | 1 |
| `16px 18px 10px` | 1 |
| `26px 22px 20px` | 1 |
| `2px 8px` | 1 |
| `2px 9px` | 1 |
| `3px` | 1 |
| `3px 0` | 1 |
| `4px 14px` | 1 |
| `4px 18px calc(env(safe-area-inset-bottom) + 24px)` | 1 |
| `5px 6px` | 1 |
| `6px` | 1 |
| `6px 0 2px` | 1 |
| `6px 12px` | 1 |
| `6px 4px` | 1 |
| `7px 11px` | 1 |
| `7px 14px` | 1 |
| `8px` | 1 |
| `9px 13px` | 1 |
| `9px 18px` | 1 |
| `calc(env(safe-area-inset-top) + 14px) 16px calc(env(safe-area-inset-bottom) + 110px)` | 1 |

### margin

| Valeur | Occurrences |
| --- | --- |
| `12px` | 5 |
| `6px` | 4 |
| `8px` | 4 |
| `0 auto` | 3 |
| `10px 0` | 3 |
| `14px` | 3 |
| `16px` | 3 |
| `0` | 2 |
| `10px` | 2 |
| `8px 0` | 2 |
| `0 0 0 6px font-size:clamp(30px,10vw,44px) --c:${p.color` | 1 |
| `0 0 12px` | 1 |
| `0 auto 10px margin-top:10px margin-top:10px margin-bottom:12px --c:${p.color` | 1 |
| `0 auto 10px padding:10px 0 --c:${t.color` | 1 |
| `0 auto 6px` | 1 |
| `0 auto margin-bottom:6px` | 1 |
| `0 margin-top:10px margin-top:8px font-size:18px margin-top:14px margin-top:10px font-size:34px flex:1 font-family:var(--display)` | 1 |
| `0 margin-top:8px margin-top:8px opacity:1 margin-top:8px margin-bottom:10px` | 1 |
| `10px 0 font-weight:800` | 1 |
| `10px margin-top:10px margin-top:10px margin-top:12px margin-top:12px width:58px justify-content:space-between` | 1 |
| `10px margin-top:8px` | 1 |
| `10px margin-top:8px flex:1` | 1 |
| `10px pointer-events:none margin:0 0 0 6px --c:${p.color` | 1 |
| `12px 0` | 1 |
| `12px font-family:var(--display)` | 1 |
| `12px margin-top:8px width:100% --c:${mp.color` | 1 |
| `12px margin:14px 0 6px font-size:40px font-size:18px padding:12px` | 1 |
| `14px 0 0` | 1 |
| `14px 0 text-shadow:0 0 14px var(--gold) flex:1 max-width:448px` | 1 |
| `14px margin-bottom:8px margin-top:10px margin-bottom:8px margin-top:10px margin-top:12px margin-top:14px margin-top:14px padding:10px 0 --c:${t.color` | 1 |
| `14px margin-top:14px font-size:22px font-size:20px margin-top:12px font-family:var(--display)` | 1 |
| `14px margin-top:8px margin-top:14px margin-top:8px margin-top:14px margin-top:14px margin-top:14px padding:12px justify-content:space-between` | 1 |
| `18px` | 1 |
| `18px 0` | 1 |
| `18px justify-content:space-between margin-top:12px --c:${COLORS[i]` | 1 |
| `18px margin-top:18px margin-bottom:12px justify-content:space-between` | 1 |
| `20px 0 10px` | 1 |
| `20px 0 6px margin-top:18px font-size:60px font-size:22px margin-top:6px justify-content:center` | 1 |
| `22px` | 1 |
| `22px 4px 10px` | 1 |
| `26px` | 1 |
| `26px --c:${p.color` | 1 |
| `26px --c:var(--gold) margin-top:14px margin-top:10px font-size:26px` | 1 |
| `26px 0 8px` | 1 |
| `2px 0 8px` | 1 |
| `2px margin-top:8px margin-top:8px` | 1 |
| `4px` | 1 |
| `4px 0 10px` | 1 |
| `5px` | 1 |
| `6px 0` | 1 |
| `6px 0 12px` | 1 |
| `6px auto 14px` | 1 |
| `8px ${lv>i+1?'opacity:.45':''` | 1 |
| `8px 0 14px` | 1 |
| `8px 4px` | 1 |
| `9px auto 0` | 1 |

### gap

| Valeur | Occurrences |
| --- | --- |
| `10px` | 11 |
| `6px` | 11 |
| `8px` | 9 |
| `12px` | 6 |
| `4px` | 4 |
| `14px` | 1 |
| `18px` | 1 |
| `30px` | 1 |
| `3px` | 1 |
| `4px 14px` | 1 |
| `6px 16px` | 1 |

## Animations et transitions

### animation

| Valeur | Occurrences |
| --- | --- |
| `deal .3s ease-out` | 2 |
| `none` | 2 |
| `blur .1s linear infinite` | 1 |
| `bounce 1s infinite` | 1 |
| `deal .35s ease-out` | 1 |
| `deal .35s ease-out both` | 1 |
| `flicker 7s infinite` | 1 |
| `flip .55s cubic-bezier(.2,.9,.3,1.2)` | 1 |
| `gridrun 1.4s linear infinite` | 1 |
| `livepulse 1.6s infinite` | 1 |
| `pop 1.6s ease-out forwards` | 1 |
| `pulse 2s infinite` | 1 |
| `shake .45s` | 1 |
| `shine 4.5s ease-in-out infinite` | 1 |
| `sunrise 9s ease-in-out infinite alternate` | 1 |
| `tin .3s ease-out` | 1 |
| `twinkle 5s ease-in-out infinite alternate` | 1 |

### transition

| Valeur | Occurrences |
| --- | --- |
| `background .15s` | 1 |
| `background .2s` | 1 |
| `box-shadow .25s` | 1 |
| `opacity .25s` | 1 |
| `opacity .9s, transform .9s` | 1 |
| `transform .08s,box-shadow .2s` | 1 |
| `transform .1s,box-shadow .25s` | 1 |
| `transform .32s cubic-bezier(.2,.9,.25,1)` | 1 |
| `width .5s` | 1 |

## Emoji utilisés comme décor d'interface

### Emoji dans titres de feuilles, toasts, boutons, résumés, libellés

| Emoji — contexte | Occurrences |
| --- | --- |
| `🏆 — « 🏆 Classement »` | 3 |
| `← — « ← Retour »` | 2 |
| `⚙️ — « ⚙️ »` | 2 |
| `✕ — « ✕ »` | 2 |
| `🏆 — « 🏆 »` | 2 |
| `🔭 — « ${rb?'🔭 Cible déjà repérée (+15 %)':'🔭 Faire un re »` | 2 |
| `← — « ← Quitter »` | 1 |
| `⚖️ — « ⚖️ Ton dossier s’est « égaré ». »` | 1 |
| `⚙️ — « ⚙️ Menu »` | 1 |
| `⚡ — « ⚡ Parier avec levier sur cet actif »` | 1 |
| `⚡ — « ⚡ Position ouverte : »` | 1 |
| `⚡ — « ⚡ Trading »` | 1 |
| `➜ — « ${G.acted?'Terminer mon tour ➜':'Passer mon tour s »` | 1 |
| `➜ — « ${last?'🏆 Voir le classement final':'Tour suivant  »` | 1 |
| `⭐ — « Réputation ⭐ ${h.rep} requise. »` | 1 |
| `🍳 — « 🧑‍🍳 Boulot honnête »` | 1 |
| `🎉 — « 🎉 ${name} ouvre ses portes ! »` | 1 |
| `🎭 — « 🎭 Lancer le braquage · ${fmt(cost)} · 3 PA »` | 1 |
| `🎯 — « 🎯 Plein sur le ${rl.num} · x36 »` | 1 |
| `🎰 — « 🎰 Casinos »` | 1 |
| `🎰 — « 🎰 Nouvelle soirée au casino : 3 parties (1 PA) »` | 1 |
| `🎰 — « 🎰 Tirer le levier »` | 1 |
| `🎲 — « 🎲 Démarrer la partie »` | 1 |
| `🎲 — « 🎲 Lancer la partie »` | 1 |
| `🎲 — « 🎲 Nouvelle partie »` | 1 |
| `🎲 — « 🎲 Retour au salon »` | 1 |
| `🏆 — « ${last?'🏆 Voir le classement final':'Tour suivant  »` | 1 |
| `🏠 — « 🏠 Immobilier »` | 1 |
| `🏢 — « 🏢 Entreprises »` | 1 |
| `🏦 — « 🏦 Banque »` | 1 |
| `💊 — « 💊 Trafic »` | 1 |
| `💊 — « 💊 »` | 1 |
| `💳 — « 💳 Prêt accordé : »` | 1 |
| `💼 — « 💼 Patrimoine »` | 1 |
| `💾 — « 💾 Quitter (partie sauvegardée) »` | 1 |
| `📈 — « 📈 Bourse & crypto »` | 1 |
| `📋 — « 📋 Copier le code »` | 1 |
| `📜 — « 📜 Les règles en 1 minute »` | 1 |
| `🔇 — « ${SOUND?'🔊 Son activé':'🔇 Son coupé'} »` | 1 |
| `🔊 — « ${SOUND?'🔊 Son activé':'🔇 Son coupé'} »` | 1 |
| `🔍 — « 🔍 Audit de ${o.name} : note ${grade(o.q)} »` | 1 |
| `🔍 — « 🔍 Audit · ${fmt(auditCost(o))} »` | 1 |
| `🔑 — « 🔑 ${x.n} à ${x.c} est à toi ! »` | 1 |
| `🔓 — « 🔓 ${n.e} ${n.n} débloqué : mise max ${fmt(n.max)}  »` | 1 |
| `🔗 — « 🔗 Partager le lien »` | 1 |
| `🔫 — « 🔫 Préparer un braquage »` | 1 |
| `🔭 — « 🔭 ${h.n} repéré(e) : +15 % jusqu’au prochain tour. »` | 1 |
| `🗑️ — « 🗑️ Abandonner la partie »` | 1 |
| `😈 — « 😈 Coups bas »` | 1 |
| `🚀 — « Tu entres au capital de ${o.name} 🚀 »` | 1 |
| `🚪 — « 🚪 Quitter (tu pourras revenir avec le code ${ON.co »` | 1 |
| `🦄 — « 🦄 Startups non cotées »` | 1 |
| `🧑 — « 🧑‍🍳 Boulot honnête »` | 1 |
| `🧠 — « 🧠 Comment choisir »` | 1 |
| `🧠 — « 🧠 Comment lire le marché »` | 1 |
| `🧼 — « 🧼 ${fmt(n-fee)} blanchis (frais ${fmt(fee)}) »` | 1 |
| `🧼 — « 🧼 Blanchiment »` | 1 |
