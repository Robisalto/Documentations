---
title: Procédure pour créer un nouvel article
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Fichier *Markdown*

- Dans le dossier **"Documentations"** faire une copie du fichier [template.md](C:\Users\david\MyDocuments\Documentations\KnowledgeBase\template.html) .
- Renommer le fichier et modifier comme il faut, puis enregistrer.


# Editer l'*Index des Documentations*

- Ouvrir le fichier [Index_des_Documentations.md](C:\Users\david\MyDocuments\Documentations\Index_des_Documentations.md)
- Puis rajouter le lien vers le Nouvel Article:

``[Procédure pour créer un nouvel article](Creer_un_nouvel_article.html)``

# Générer les fichiers *HTML*

- Dans le Terminal *Ubuntu* lancer le script ``BuildDocs.sh``

---
