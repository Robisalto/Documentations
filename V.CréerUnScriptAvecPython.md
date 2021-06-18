---
title: V. Créer un Script avec Python
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Introduction
## Bienvenue dans « Créer un script avec Python »
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\0. Intro - Bienvenue dans « Créer un script avec Python ».mp4" type="video/mp4">
</video>

# I. Mettre en place l'environnement de développement
## I-III. Installer les modules dans PyCharm
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\I-III. Installer les modules dans PyCharm.mp4" type="video/mp4">
</video>

## I-IV. Intégrer Mercurial dans PyCharm
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\I-IV. Intégrer Mercurial dans PyCharm.mp4" type="video/mp4">
</video>

## I-V. Créer une classe
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\I-V. Créer une classe.mp4" type="video/mp4">
</video>

## I-VI. Mettre en place le corps de la méthode ``get``
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\I-VI. Mettre en place le corps de la méthode get.mp4" type="video/mp4">
</video>

## I-VII. Appeler la méthode ``get``
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\I-VII. Appeler la méthode get.mp4" type="video/mp4">
</video>

# II. Créer des éléments de base base d'une classe Python
## II-I. Ajouter un constructeur
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\II-I. Ajouter un constructeur.mp4" type="video/mp4">
</video>

## II-II. Réécrire la méthode GET
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\II-II. Réécrire la méthode GET.mp4" type="video/mp4">
</video>

## II-III. Utiliser une expression rationnelle
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\II-III. Utiliser une expression rationnelle.mp4" type="video/mp4">
</video>

## II-IV. Utiliser des annotations
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\II-IV. Utiliser des annotations.mp4" type="video/mp4">
</video>

## II-V. Contrôler le type et les assertions
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\II-V. Contrôler le type et les assertions.mp4" type="video/mp4">
</video>

# III. Faire une gestion avancée des classes
## III-I. Déclarer des variables de classe
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\III-I. Déclarer des variables de classe.mp4" type="video/mp4">
</video>

## III-II. Appeler des variables de classe
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\III-II. Appeler des variables de classe.mp4" type="video/mp4">
</video>

## III-III. Créer des propriétés de la classe
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\III-III. Créer des propriétés de la classe.mp4" type="video/mp4">
</video>

## III-IV. Utiliser des propriétés de la classe
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\III-IV. Utiliser des propriétés de la classe.mp4" type="video/mp4">
</video>

## III-V. Comprendre l'esprit pythonique des propriétés
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\III-V. Comprendre l'esprit pythonique des propriétés.mp4" type="video/mp4">
</video>

# IV. Manipuler des Dictionnaires et des Tuples
## IV-I. Supprimer un élément du dictionnaire
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\IV-I. Supprimer un élément du dictionnaire.mp4" type="video/mp4">
</video>

## IV-II. Effectuer une suppression de différentes manières
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\IV-II. Effectuer une suppression de différentes manières.mp4" type="video/mp4">
</video>

```python
# 1ère façon
try:
            del reponse['cache--control']
        except KeyError:
            pass

# 2ème
reponse.pop('cache--control', None)
```

## IV-III. Comprendre le dictionnaire
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\IV-III. Comprendre le dictionnaire.mp4" type="video/mp4">
</video>

## IV-IV. Découvrir les façon d'itérer sur un dictionnaire
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\IV-IV. Découvrir les façon d'itérer sur un dictionnaire.mp4" type="video/mp4">
</video>

## IV-V. Utiliser l'opérateur SPLAT
<p class="info"> Opérateur d'unpacking (*x) </p>
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\IV-V. Utiliser l'opérateur SPLAT.mp4" type="video/mp4">
</video>

# V. Traiter des chaînes et la programmation GUI
## V-I. Etablir les différences entre bytes et STR
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-I. Etablir les différences entre bytes et STR.mp4" type="video/mp4">
</video>

```python
# En BYTES (Tableau d'octets)
print(type(b"coucou"))
# retourne:
<class 'bytes'>

# En STR (Chaîne de caratères)
print (type("coucou"))
# retourne:
<class 'str'>
```

## V-II. Convertir des bytes vers STR
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-II. Convertir des bytes vers STR.mp4" type="video/mp4">
</video>

## V-III. Utiliser une expression rationnelle pour extraire l'encodage
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-III. Utiliser une expression rationnelle pour extraire l'encodage.mp4" type="video/mp4">
</video>

## V-IV. Gérer les différentes bibliothèques GUI pour Python
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-IV. Gérer les différentes bibliothèques GUI pour Python.mp4" type="video/mp4">
</video>

## V-V. Générer du code wxPython avec wxGlade
<p class="info"> Sur Python2 car wxPython n'existe pas encore pour Python3 😢 </p>
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-V. Générer du code wxPython avec wxGlade.mp4" type="video/mp4">
</video>

## V-VI. Voir un exemple d'application GUI wxPython
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-VI. Voir un exemple d'application GUI wxPython.mp4" type="video/mp4">
</video>

## V-VII. Conclure sur le développement d'un script avec Python
<video width="1000" height="562" controls>
  <source src="V.CréerUnScriptAvecPython\V-VII. Conclure sur le développement d'un script avec Python.mp4" type="video/mp4">
</video>

# CERTIFICATION
- [Certificat - Créer un Script avec Python](V.CréerUnScriptAvecPython\CertificateOfCompletion_Creer un script avec Python.pdf)

---

<p style="text-align: center"> [V. Créer un Script avec Python - Version PDF](V.CréerUnScriptAvecPython.pdf) </p>

---
