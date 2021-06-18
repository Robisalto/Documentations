---
title: VII. Python les structures de données
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Introduction
## Bienvenue dans « Python : Les structures de données »
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\0. Introduction.mp4" type="video/mp4">
</video>

# I. Aborder les structures de données
## I-I. S'initier aux structures de données
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-I. S'initier aux structures de données.mp4" type="video/mp4">
</video>

## I-II. Se servir des fichiers d'exercice
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-II. Se servir des fichiers d'exercice.mp4" type="video/mp4">
</video>

## I-III. Importer un CSV dans une liste
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-III. Importer un CSV dans une liste.mp4" type="video/mp4">
</video>

## I-IV. Importer avec le module Codecs
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-IV. Importer avec le module Codecs.mp4" type="video/mp4">
</video>

```python
import csv
import codecs

with codecs.open('d:\\data\\departement.csv', encoding='utf8', errors='replace') as dept:
    rd = csv.reader(dept, delimiter=',')
    for r in rd:
        print(r[1:3])
```

## I-V. Ajouter des éléments dans une liste
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-V. Ajouter des éléments dans une liste.mp4" type="video/mp4">
</video>

```python
import csv
import codecs

with codecs.open('d:\\data\\departement.csv', encoding='utf8', errors='replace') as dept:
    rd = csv.reader(dept, delimiter=',')
    departements = []
    for r in rd:
        departements.append(r[2])

print(departements)
departements.extend(['Geneve', 'Vaud', 'Valais'])
print(departements) 
```

## I-VI. Modifier les listes
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-VI. Modifier les listes.mp4" type="video/mp4">
</video>

```python
import csv
import codecs

with codecs.open('d:\\data\\departement.csv', encoding='utf8', errors='replace') as dept:
    rd = csv.reader(dept, delimiter=',')
    departements = []
    for r in rd:
        departements.append(r[2])

departements.extend(['Geneve', 'Vaud', 'Valais'])
# departements.insert(2, ['Neuchatel', 'Jura'])

departements[2:2] = ['Neuchatel', 'Jura']

print(departements)
# print(departements.pop(0))
# print(departements)
```


## I-VII. Trier les listes
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-VII. Trier les listes.mp4" type="video/mp4">
</video>

```python
import csv
import codecs

with codecs.open('d:\\data\\departement.csv', encoding='utf8', errors='replace') as dept:
    rd = csv.reader(dept, delimiter=',')
    departements = []
    for r in rd:
        departements.append(r[2])

departements.extend(['Geneve', 'Vaud', 'Valais'])

# departements.sort(key=int)
# departements.sort(key=lambda l: l[-1])
departements.sort(key=lambda l: l[::-1])

print(departements)
```

## I-VIII. Trier avec une expression lambda
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-VIII. Trier avec une expression lambda.mp4" type="video/mp4">
</video>

## I-IX. Comprendre l'unpacking
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-IX. Comprendre l'unpacking.mp4" type="video/mp4">
</video>

## I-X. Joindre des listes
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-X. Joindre des listes.mp4" type="video/mp4">
</video>

## I-XI. Appliquer des fonctions aux listes
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-XI. Appliquer des fonctions aux listes.mp4" type="video/mp4">
</video>

## I-XII. Utiliser la compréhension de liste
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-XII. Utiliser la compréhension de liste.mp4" type="video/mp4">
</video>

## I-XIII. Comprendre les tuples
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\I-XIII. Comprendre les tuples.mp4" type="video/mp4">
</video>
<p class="info"> INFO: Contrairement à la liste un Tuple est **IMMUABLE** </p>

# II. En savoir plus sur les structures natives
## II-I. Découvrir les sets
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-I. Découvrir les sets.mp4" type="video/mp4">
</video>

<p class="info"> **Set:** Vient de la théorie des ensembles. Les éléments ne sont pas rangés par ordre. Chaque éléments de l'ensemble est unique (pas de doublons). </p>

## II-II. Créer des sets
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-II. Créer des sets.mp4" type="video/mp4">
</video>

```python
import csv
import codecs

with codecs.open('d:\\data\\departement.csv', encoding='utf8', errors='replace') as dept:
    rd = csv.reader(dept, delimiter=',')
    departements = set(r[2] for r in rd)

departements.add('Valais')
departements.update(['Vaud', 'Valais'])

suisse = set(['Valais', 'Vaud', 'Geneve', 'Neuchatel'])

print(len(departements))
```

## II-III. Manipuler des sets
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-III. Manipuler des sets.mp4" type="video/mp4">
</video>

<p class="info"> Le SET est **muable** par défaut. Sauf si l'on utilise un `frozenset([])` </p>

## II-IV. Modifier des sets
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-IV. Modifier des sets.mp4" type="video/mp4">
</video>

## II-V. Créer des dictionnaires avec ZIP
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-V. Créer des dictionnaires avec ZIP.mp4" type="video/mp4">
</video>

## II-VI. Générer directement un dictionnaire
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-VI. Générer directement un dictionnaire.mp4" type="video/mp4">
</video>

## II-VII. Découvrir le module Collections
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-VII. Découvrir le module Collections.mp4" type="video/mp4">
</video>

```python
import collections
```

## II-VIII. S'initier à Itertools
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-VIII. S'initier à Itertools.mp4" type="video/mp4">
</video>

## II-IX. Utiliser Itertools
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-IX._Utiliser_Itertools.mp4" type="video/mp4">
</video>

## II-X. Récapituler les notions vues sur les structures de données
<video width="1080" height="606" controls>
  <source src="VII.PythonLesStructuresDeDonnées\II-X._Rcapituler_les_notions_vues_sur_les_structures_de_donnes.mp4" type="video/mp4">
</video>

```python
# Liste en Python
ma_liste = [..., ..., ...]

# Tuple:
mon_tuple = (..., ..., ...)

# Set (ensemble)
mon_set = set([..., ..., ...])
```

# CERTIFICATION
<p style="text-align: center; text-decoration-color: red">
  [CertificateOfCompletion_Python Les structures de donnees.pdf](VII.PythonLesStructuresDeDonnées\CertificateOfCompletion_Python Les structures de donnees.pdf)
</p>

---

<p style="text-align: center"> [VII. Python les structures de données - Version PDF](VII.PythonLesStructuresDeDonnées.pdf) </p>

---

