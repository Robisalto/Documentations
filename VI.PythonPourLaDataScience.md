---
title: VI. Python pour la data science
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Introduction
## Bienvenue dans « Python pour la data science »
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\0-I. Bienvenue dans « Python pour la data science ».mp4" type="video/mp4">
</video>

# I. Aborder le langage Python
## I-I. Comprendre l'importance de la data science
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\I-I. Comprendre l'importance de la data science.mp4" type="video/mp4">
</video>

## I-II. Expliquer le choix de Python
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\I-II. Expliquer le choix de Python.mp4" type="video/mp4">
</video>

## I-III. Installer Python
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\I-III. Installer Python.mp4" type="video/mp4">
</video>

<p class="info"> **Anaconda:** Pour la Data Science. </p>
<https://www.anaconda.com/>


## I-IV. Chapter QUIZZ

1. Un modèle de machine learning s'élabore à l'aide de _____. `données d'entraînement`
2. Une distribution de Python pour la data science s'appelle _____. `Anaconda`
3. Python est un langage _____. `portable`

# II. Mener des opérations basiques
## II-I. Effectuer des opérations basiques sur les listes
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\II-I. Effectuer des opérations basiques sur les listes.mp4" type="video/mp4">
</video>

## II-II. Effectuer des opérations avancées sur les listes
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\II-II. Effectuer des opérations avancées sur les listes.mp4" type="video/mp4">
</video>

## II-III. Tirer parti des dictionnaires
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\II-III. Tirer parti des dictionnaires.mp4" type="video/mp4">
</video>

## II-IV. Découvrir les compréhensions

<p class="info"> Compréhensions VS Générateurs </p> 

<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\II-IV. Découvrir les compréhensions.mp4" type="video/mp4">
</video>

## II-V. Chapter QUIZZ

1. On peut concaténer deux listes à l'aide de l'opérateur _____. `+`
2. Une liste Python peut être _____. `hétérogène`
3. Pour chercher un élément dans un dictionnaire, on utilise _____. `sa clé`
4. Grâce à _, vous pouvez appliquer une fonction à chaque élément d'une liste. `la compréhension`

# III. Charger et préparer les données
## III-I. Comprendre l'intérêt du prétraitement de données
Essentiel pour tout projet Data Science !!!
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-I. Comprendre l'intérêt du prétraitement de données.mp4" type="video/mp4">
</video>

Les étapes du prétraitement:

1. Nettoyage de données
    1. Gérer les données manquantes
    2. Gérer les données ébruitées
    3. Corriger les inconsistances
    4. Supprimer la redondance
2. Intégration
    1. Différentes sources de données
    2. Problème d'identification (ID)
    3. Problème d'incohérence des valeurs des attributs
3. Transformation
4. Réduction
5. Discrétisation

## III-II. Charger des fichiers Excel & CSV
*CSV: Comma Separated Values
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-II. Charger des fichiers Excel & CSV.mp4" type="video/mp4">
</video>

## III-III. Charger un fichier JSON
JSON*: JavaScript Object Notation
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-III. Charger un fichier JSON.mp4" type="video/mp4">
</video>

```python
import json
```

## III-IV. Interroger une base de données SQL
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-IV. Interroger une base de données SQL.mp4" type="video/mp4">
</video>

```python
# Import modules
import numpy
import pandas as pd
import pyodbc

# DB Connection
conn = pyodbc.connect(
    "Driver={SQL Server Native Client 11.0};"
    "Server=MGR2-BTH108W\SQLSERVER;"
    "Database=irissql;"
    "Trusted_Connection=yes;"
)

requête = """SELECT [Sépales.Longueur], EspècesId
           FROM dbo.iris_données;"""
T = pd.read_sql(requête, conn)

# Programme
T.head()

T.shape
```

## III-V. Concaténer différentes sources de données
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-V. Concaténer différentes sources de données.mp4" type="video/mp4">
</video>

## III-VI. Fusionner différentes sources de données
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-VI. Fusionner différentes sources de données.mp4" type="video/mp4">
</video>

## III-VII. Manipuler des données manquantes
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-VII. Manipuler des données manquantes.mp4" type="video/mp4">
</video>

## III-VIII. Maîtriser les statistiques descriptives avec `NumPy`
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-VIII. Maîtriser les statistiques descriptives avec NumPy.mp4" type="video/mp4">
</video>

```python
%timeit sum(tab)

156 ms ± 392 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
```

## III-IX. Maîtriser les statistiques descriptives avec `Pandas`
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\III-IX. Maîtriser les statistiques descriptives avec Pandas.mp4" type="video/mp4">
</video>

## III-X. QUIZZ

1. La fonction _____ lie des DataFrames par des colonnes communes. `merge()`
2. Pour concaténer des données en Pandas, on utilise la fonction _____. `concat()`
3. La fonction sum() de NumPy est plus rapide que celle de Python. `VRAI`
4. La fonction Pandas qui permet d'éliminer les données manquantes s'appelle _____. `notnull()`
5. Pour afficher tous les fichiers d'un répertoire, on utilise la fonction _____. `os.listdir()`
6. La dernière étape de prétraitement des données est l'étape de _____. `discrétisation`
7. Pour se connecter à SQL Server avec Python, on peut utiliser _____. `pyodbc`
8. Pour convertir un dictionnaire Python en JSON, on utilise la fonction _____ du module json. `dumps()`
9. Pandas comporte la fonction _____ qui retourne des informations complètes sur une série. `describe()`

# IV. Manipuler différents types de données
## IV-I. Découvrir différents types de données
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-I. Découvrir différents types de données.mp4" type="video/mp4">
</video>

![*Schéma des différents types de données*](VI.PythonPourLaDataScience/Untitled.png)

### Données *QUALITATIVES:*
 1. Ordinales
    - Classement intrinsèque
    - Niveau de satifaction
  2. Nominales
      + Sans classement intrinsèque
      + Profession, Pays, Couleurs, etc.

### Données *QUANTITATIVES*:
  + 1. Intervalles
    - Ordonnables et mesurables
    - Zéro fixé arbitrairement
    - Température (continue), Date (discrète)
  2. Ratio
      + Ordonnables et mesurables
      + Zéro identifiable
      + Distance (continue), Age (discrète)

## IV-II. Manipuler des données quantitatives avec NumPy
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-II. Manipuler des données quantitatives avec NumPy.mp4" type="video/mp4">
</video>

## IV-III. Aborder les techniques d'encodage
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-III. Aborder les techniques d'encodage.mp4" type="video/mp4">
</video>

2 types d'encodage différents:

1. Encodage Numérique: 
2. Encodage `One-hot`

## IV-IV. Manipuler des données textuelles avec Pandas
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-IV. Manipuler des données textuelles avec Pandas.mp4" type="video/mp4">
</video>

## IV-V. Manipuler des données textuelles avec NLTK

> **Tokenisation*:** Découper en jeton. Découper une chaîne en maillons

```python
import nltk
from nltk.tokenize import WordPunctTokenizer
nltk.download('punkt')
nltk.download('stopwords')
```

<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-V. Manipuler des données textuelles avec NLTK.mp4" type="video/mp4">
</video>

## IV-VI. Utiliser les séries temporelles

```python
# Module temporel pour Python:
from datetime import datetime
# Moins performant que les outils NumPy ou Pandas

```

<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-VI. Utiliser les séries temporelles.mp4" type="video/mp4">
</video>

## IV-VII. Manipuler les images
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\IV-VII. Manipuler les images.mp4" type="video/mp4">
</video>

## IV-VIII. QUIZZ

1. Les objets Date de Python sont moins _____ que leurs équivalents NumPy et Pandas. `preformants`
2. Le processus de découpage d'un texte en mots s'appelle _____. `la tokénisation`
3. Pour obtenir la dimension d'un tableau dans NumPy, on utiliser la fonction _____. `ndim()`
4. Quand les catégories ont un classement intrinsèque, on parle de données _____. `quantitatives ordinales`
5. La fonction Python _____ aide à standardiser des données de chaînes de caractères. `capitalize()`
6. L'encodage _____ consiste à convertir chaque valeur d'une variable qualitative en une nouvelle colonne. `One-hot`
7. Sur une image dans Matplotlib, la fonction max() est un indicateur _____. `d'intensité`


# V. Aborder la visualisation des données
## V-I. Découvrir les bases de la visualisation de données
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\V-I. Découvrir les bases de la visualisation de données.mp4" type="video/mp4">
</video>

## V-II. Aborder Matplotlib
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\V-II. Aborder Matplotlib.mp4" type="video/mp4">
</video>

## V-II. Appréhender Seaborn
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\V-II. Appréhender Seaborn.mp4" type="video/mp4">
</video>

## V-III. Découvrir Bokeh
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\V-III. Découvrir Bokeh.mp4" type="video/mp4">
</video>

## V-IV. Aller plus loin avec Matplotlib
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\V-IV. Aller plus loin avec Matplotlib.mp4" type="video/mp4">
</video>

## V-V. Chapter QUIZZ
1. La fonction _____ de Seaborn permet de montrer les relations multidimensionnelles entre différentes variables. `pairplot()`
2. Matplotlib génère un diagramme circulaire avec la fonction _____. `pie()`
3. On peut générer plusieurs graphiques avec la fonction _____ de Matplotlib. `subplot()`
4. Bokeh permet de générer des graphiques _____. `interactifs`
5. Les diagrammes _____ permettent de présenter des variables catégorielles. `en bâtons`

---


# VI. S'initier au web scraping
## VI-I. Comprendre le web scraping
Technique utilisée pour extraire de grandes quantités de données à partir de sites web. Pour les traiter et les utiliser. 

- Extraire des informations sur un produit
- Réaliser une veille technologique
- Extraire des offres d'emploi ou stage
- Alimenter une application de diagnostic
- etc
- les Outils
    - BeautifulSoup (bs4) (plus facile)
    - lxml
    - re (Regular Expressions)
    - Scrapy

### Les étapes du Web Scrapping:

1. Récupérer les données
2. Analyse des données
3. Stocker les informations

<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VI-I. Comprendre le web scraping.mp4" type="video/mp4">
</video>

[Web scraping](https://fr.wikipedia.org/wiki/Web_scraping)

## VI-II. Explorer un document HTML avec Beautiful Soup
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VI-II. Explorer un document HTML avec Beautiful Soup.mp4" type="video/mp4">
</video>

## VI-III. Découvrir les objets Tag et NavigableString
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VI-III. Découvrir les objets Tag et NavigableString.mp4" type="video/mp4">
</video>

## VI-IV. Aller plus loin avec le web scraping
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VI-IV. Aller plus loin avec le web scraping.mp4" type="video/mp4">
</video>

## VI-V. Pratiquer le web scraping
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VI-V. Pratiquer le web scraping.mp4" type="video/mp4">
</video>

## VI-VI. Chapter QUIZZ

1. Pour obtenir le premier paragraphe d'un document HTML avec BeautifulSoup, on utilise la propriété _____. `p`
2. Parmi les bibliothèques de web scraping pour Python, on trouve _____. `BeautifulSoup`
3. Pour chercher les éléments d'une même balise HTML avec BeautifulSoup, on utilise la fonction _____. `find_all()`
4. L'objet contenu dans une balise est de type _____ en BeautifulSoup. `NavigableString`
5. La fonction select de BeautifulSoup retourne _____. `une liste`


# VII. Se familiariser avec les algorithmes de machine learning
## VII-I. Comprendre la régression linéaire
<p class="info"> La régression linéaire est une méthode de machine learning utilisée pour prédire la valeur d'une variable cible en fonction d'une ou plusieurs variables. </p>
<p class="info"> Une relation linéaire est considérée entre la variable cible et la/les variable(s) explicative(s). </p>
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-I. Comprendre la regression linéaire.mp4" type="video/mp4">
</video>

[Régression linéaire](https://fr.wikipedia.org/wiki/R%C3%A9gression_lin%C3%A9aire)

[Linear Regression in Python - Real Python](https://realpython.com/linear-regression-in-python/)

## VII-II. Mettre en œuvre la régression linéaire
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-II. Mettre en œuvre la régression linéaire.mp4" type="video/mp4">
</video>

## VII-III. Comprendre l'algorithme SVM
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-III. Comprendre l'algorithme SVM.mp4" type="video/mp4">
</video>

## VII-IV. Utiliser l'algorithme SVM
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-IV. Utiliser l'algorithme SVM.mp4" type="video/mp4">
</video>

## VII-V. Comprendre la classification naïve bayésienne
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-V. Comprendre la classification naïve bayésienne.mp4" type="video/mp4">
</video>

### Exemples
- Détection de Spams
- Reconnaissance faciale
- Diagnostic médical
- Prédicition météo

## VII-VI. Pratiquer la classification naïve bayésienne
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-VI. Pratiquer la classification naïve bayésienne.mp4" type="video/mp4">
</video>

## VII-VII. Comprendre l'algorithme des k-moyennes
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-VII. Comprendre l'algorithme des k-moyennes.mp4" type="video/mp4">
</video>

## VII-VIII. Utiliser l'algorithme des k-moyennes
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-VIII. Utiliser l'algorithme des k-moyennes.mp4" type="video/mp4">
</video>

## VII-IX. Analyser en composante principale PCA
<p class="info"> Analyse en Composantes Principales *(PCA)* </p>
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VII-IX. Analyser en composante principale PCA.mp4" type="video/mp4">
</video>

## VII-X. Chapter QUIZZ
1. Le classifieur gaussien de Bayes est utilisé pour des attributs _____. `à distribution normale`
2. Quand on crée une instance de la classe LinearRegression, on peut passer la propriété _____ au constructeur. `fit_intercept`
3. Une approche très utilisée pour accélérer les algorithmes de machine learning s'appelle _____. `PCA`
4. On parle de régression linéaire multiple s'il y a _____. `plusieurs variables explicatives` 👎
5. SVM fait partie de la bibliothèque _____. `sklearn`
6. Dans SVM, le meilleur séparateur entre deux groupes est appelé « _____ ». `hyperplan` 👎
7. On peut déployer un modèle bayésien avec la fonction _____ du modèle. `fit()`
8. En manipulant l'algorithme des k-moyennes, il est intéressant de mettre en évidence _____ de chaque groupe. `le centre`
9. Dans l'algorithme des k-moyennes, une des approches pour trouver la valeur de k est la méthode _____. `Elbow`

# VIII. Aborder le deep learning avec Keras et TensorFlow
## VIII-I. Comprendre le deep learning
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-I. Comprendre le deep learning.mp4" type="video/mp4">
</video>
![*Comprendre le Deep Learning*](VI.PythonPourLaDataScience\VIII-I. Comprendre le deep learning.png "Comprendre le Deep Learning")

## VIII-II. Aborder les concepts du deep learning
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-II. Aborder les concepts du deep learning.mp4" type="video/mp4">
</video>

## VIII-II. Aborder les concepts du deep learning
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-II. Aborder les concepts du deep learning.mp4" type="video/mp4">
</video>

## VIII-III. Découvrir TensorFlow
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-III. Découvrir TensorFlow.mp4" type="video/mp4">
</video>

## VIII-IV. Aborder Keras
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-IV. Aborder Keras.mp4" type="video/mp4">
</video>

## VIII-V. Comprendre et préparer les données
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-V. Comprendre et préparer les données.mp4" type="video/mp4">
</video>

## VIII-VI. Déployer le modèle
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\VIII-VI. Déployer le modèle.mp4" type="video/mp4">
</video>

## VIII-VII. Chapter QUIZZ
1. Keras comporte une fonction _____. `normalize()`
2. Keras est intéressant par sa simplicité. `VRAI`
3. Parmi les fonctions d'activation de Keras, on trouve _____. `relu` 👎
4. Les couches intermédiaires d'un réseau de neurones sont appelées couches _____. `cachées` 👎
5. Le mode _____ de TensorFlow permet une évaluation immédiate des opérations sans créer de graphique. `Eager Execution` 👎
6. Le concept du deep learning est l'automatisation de l'algorithme _____ en utilisant un réseau d'apprentissage profond. `d'extraction des caractéristiques`

# Conclusion
## Clonclure sur Python pour la Data Science
<video width="1000" height="562" controls>
  <source src="VI.PythonPourLaDataScience\Clonclure sur Python pour la Data Science.mp4" type="video/mp4">
</video>

# CERTIFICATION
1. [Certificat - Python pour la data science](VI.PythonPourLaDataScience\CertificateOfCompletion_Python pour la data science.pdf)
2. [Certificat - Python pour la data science *(Project Management Institute)*](VI.PythonPourLaDataScience\CertificateOfCompletion_Python pour la data science(1).pdf)


---

<p style="text-align: center"> [VI. Python pour la data science - Version PDF](VI.PythonPourLaDataScience.pdf) </p>

---
