---
title: POEI DevOps - Python
author: Yohann LESUEUR
date: 2021-07-26
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---

<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.9/highlight.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.9/languages/css.min.js">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.9/styles/atom-one-light.min.css">

#### Introduction

Formateur: 

Mail: <ylesueur@dawan.fr>




# Doc Source

<iframe src="2021-07-26-POEI-Python/Formation_Python_init_appro_V3.pdf" allowfullscreen=true> </iframe>

Document: [Formation_Python_init_appro_V3.pdf](2021-07-26-POEI-Python/Formation_Python_init_appro_V3.pdf)


## Docs en ligne

- Framapad: <https://mensuel.framapad.org/p/python-26>

- Git: <https://github.com/ylesueur-dawan/python-26-07-2021>

- W3School: <https://www.w3schools.com/python/>



# Découvrir le langage

- Historique, alternatives
- A propos de Python 2 et Python 3
- Présentation et installation de Python dans un environnement Windows ou Linux
- Mise en oeuvre de Python : accès au terminal
- Environnements de développement assistés ; association à des outils connus et éditeurs pratiques

## Atelier : Mise en place d'un environnement de développement

### Installation d'un environnement Virtuel:

Un environnement virtuel est un environnement isolé de votre système. On va créer un environnement virtuel pour chaque projet python.
Ainsi chaque projet python aura sa propre version de python et ses propres modules.

#### Création de *venv*

```bash
python -m venv venv-project1

```

```bash
odin@BBG58Y2:/mnt/c/Users/Admin stagiaire.DESKTOP-8967908/FORMATION/Python$ tree -L 1 venv-project1/
venv-project1/
├── Include
├── Lib
├── Scripts
└── pyvenv.cfg

3 directories, 1 file

```

#### Activation de *venv*

```powershell
./venv/Scripts/Activate.ps1

```

### Pylint

Pour assurer l'intégrité du code Python on installe `pylint` dans l'environnement virtuel:

```python
pip install pylint
```











---

# Maîtriser la syntaxe de base

Syntaxe de base, en interprétation directe et en script

## Déclarer des variables en Python, types internes et leur utilisation

Une variable c'est une zone mémoire dans laquelle on peut stocker des informations.
Par exemple: le nom de l'utilisateur, l'age etc...

Il y a plusieurs types de variables en python:

- Chaîne de caractères (string) 

- Numeriques (int, float, complex)

- Booléen (bool)


### Python est un langage dynamiquement typé: 
Les types sont implicites et une variable peut changer à n'importe quel moment. 

### Python est un langage fortement typé: 
On ne peut pas faire d’opération entre les types différents types.

Il y a des règles à respecter dans le nommage des variables:

- le nom d'une variable ne peut contenir que des lettres, chiffres et des underscores ( _ ).

- le nom d'une variable ne peut pas commencer par un chiffre

- le nom d'une variable est sensible au majuscule.  Age, AGE et AgE sont 3 variables différentes.

- On ne peut pas utiliser de mot clefs python pour créer nos variables.

<https://www.w3schools.com/python/python_ref_keywords.asp>

### Conventions de nommages:
PEP 8 *(Python Enhancements Proposals)*:  <https://www.python.org/dev/peps/pep-0008/#naming-conventions>


1. Le nom des variables en **snake_case + minuscule**, exemple: *nom_de_la_variable*

2. Le nom des pseudo-constantes en **snake_case + Majuscules**: *NOM_DE_LA_CONSTANTE*

3. Une variable qui commence par un `_`, est une **variable privée**

4. Toujours avoir des noms de variables explicites (on évite les abréviations).

## Exemples de variables *(code)*

```python
# un commentaire, cette ligne est ignorée par python

prenom = "Charles" # str
age = 15 # int
c = 15j # complex
pi = 3.14 # float
erreur = True # bool

# Lors de l'exécution du programme, python va remplacer la variable prenom
# par sa valeur
# print("Charles")
print(prenom)

# Concaténation: Ajoute une chaîne de caractères à la suite d'une autre.
print("Salut" + "Tout le monde")

# print("La variable prénom: " + "Charles")
# print("La variable prénom: Charles")
print("La variable prénom: " + prenom)

# print("La variable age: " + age) # <- Erreur, on ne peut pas concatener une 
# chaîne de caracteres avec un autre type.

# La fonction str(): permet de créer une nouvelle chaîne de caractères à partir
# d'une variable d'un autre type.
# print("La variable age: " + str(15))
# print("La variable age: " + "15")
# print("La variable age: 15")
print("La variable age: " + str(age))

# variable-quelque = 5 <- erreur, nom invalide

# 5variable = "salut" <- erreur, nom invalide
va5dsd3d52 = "salut"

# print(Age) <- erreur, notre variable n'a pas de majuscule
# and = "Salut"

MAX_SCREEN = 1280
VITESSE_LUMIERE = 300_000

prenom = "Salut"
print("La variable prénom: " + prenom)

# _privee = "salut"
# print(_privee)


# En python simple ou double quote, aucune importance
nom = 'Doe' # str

a = 0.99 # float
a = .99 # float

# b = 0.99
b = a

```


## Utiliser les opérateurs et expressions

### Opérateurs arithmétiques

#### Concaténation

```python
a = "2"
b = "3"
c = a + b # concatenation
print(c)
print( type(c) )
#  ---------------------------
# | str + str = concatenation |
# | str + number = Erreur     |
# | number + number = addition|
#  ---------------------------

```


<div class=info> L'opération `int(a)` permet de transformer une chaîne de caractère en nombre entier. </div>

#### Addition

```python
print("\t---- Addition ---")

resultat = nombre + nombre2
print("Resultat: " + str(resultat))

# Si on a encore besoin de la variable résultat, on peut créer un nouvelle variable
resultat2 = resultat + 2
print("Resultat2: " + str(resultat2))

# Sinon on peut écraser la valeur précédente
# resultat = 5 + 2
# resultat = 7
resultat = resultat + 2
print("Resultat: " + str(resultat))

# resultat = resultat + 2
# resultat = 7 + 2
# resultat = 9
resultat += 2
print("Resultat: " + str(resultat))

```

#### Soustraction

```python
print("\t---- Soustraction ---")

resultat = nombre - nombre2
print("Resultat: " + str(resultat))

resultat = resultat - 2
print("Resultat: " + str(resultat))

resultat -= 2
print("Resultat: " + str(resultat))
```

#### Multiplication

```python
print("\t---- Mutliplication ---")
# Sur chaine de caractères, on multiplie la concatenation.

resultat = nombre * nombre2
print("Resultat: " + str(resultat))

resultat = resultat * 2
print("Resultat: " + str(resultat))

resultat *= 2
print("Resultat: " + str(resultat))
```

#### Division

```python
print("\t---- Division ---")

# La resultat de la division est toujours un nombre à virgule.

resultat = nombre / nombre2
print("Resultat: " + str(resultat))

resultat = resultat / 2
print("Resultat: " + str(resultat))

resultat /= 2
print("Resultat: " + str(resultat))

print("\t---- Puissance ---")

resultat = nombre ** 3 # 2³ 
print("Resultat: " + str(resultat))

resultat = resultat ** 2 # 2²
print("Resultat: " + str(resultat))

resultat **= 6 # 64^6
print("Resultat: " + str(resultat))

print("\t---- Division Entière ---")

resultat = 11 // 2 # 5 et il reste 1 
print("Resultat: " + str(resultat))

resultat = resultat // 2
print("Resultat: " + str(resultat))

resultat //= 2
print("Resultat: " + str(resultat))
```

#### Modulo *(%)*

```python
print("\t---- Modulo ---")

# Le modulo c'est le reste d'une division entiere (euclidienne).

resultat = 11 % 2 # 5 et il reste 1 <- modulo
print("Resultat: " + str(resultat))

resultat = 11 % 4 # 11 // 4 = 2 et il reste 3 <- modulo
print("Resultat: " + str(resultat))

resultat %= 2
print("Resultat: " + str(resultat))

# 12 % 2 = 6 et il reste 0 <- le nombre pair
# 13 % 2 = 6 et il reste 1 <- le nombre est impair
# 14 % 2 = 7 et il reste 0 
# on ne peut faire 14 % 2 = 3 et il reste 8 <- impossible car on peut encore le diviser
```

### Opérateurs comparatif

#### Comparaison de nombres

```python
nombre = 7
nombre2 = 5

resultat = nombre > nombre2 # Une comparaison renovie toujours vrai ou faux.
print("Est-ce que nombre est strictement superieur à nombre2 ? " + str(resultat)) 

resultat = nombre >= nombre2
print("Est-ce que nombre est superieur ou égal à nombre2 ? " + str(resultat)) 

resultat = nombre < nombre2 # Une comparaison renovie toujours vrai ou faux.
print("Est-ce que nombre est strictement inferieur à nombre2 ? " + str(resultat)) 

resultat = nombre <= nombre2
print("Est-ce que nombre est inferieur ou égal à nombre2 ? " + str(resultat)) 

nombre = 5
nombre2 = 5

# =  : affectation
# == : comparaison
resultat = nombre == nombre2
print("Est-ce que nombre est égal à nombre2 ? " + str(resultat)) 
```

#### Comparaison de chaîne de caractères

```python
prenom = "Anne"
prenom2 = "David"
resultat = prenom != prenom2
print("Est-ce que prenom est égal à prenom2 ? " + str(resultat))
```


## Présentation et détail des structures de contrôle : les tests, les boucles

### Les Conditions

#### If, elif, else

```python
print("----- Bloc conditionnel ----- ")

# Si l'age de l'utilisateur est inferieur à 18, alors on affiche le message
#  "vous ne pouvez pas louer de voiture"

age = 17

if age < 18:
    #bloc d'instructions
    print("vous ne pouvez pas louer de voiture")

print("On continue")

# Si l'age de l'utilisateur est inférieur à 18, alors on affiche le message
#  "vous ne pouvez pas louer de voiture"
# Sinon (dans tous les autres cas), on affiche le message
#   "Quel modèle voulez-vous ?"

if age < 18:
    print("vous ne pouvez pas louer de voiture")
else:
    print("Quel modèle voulez-vous ?")
    

if age < 18:
    print("Reduction -18 ans")
# else if
elif age < 25:
    print("Reduction jeune")
else:
    print("Pas de réduction")
```

### Opératieurs logiques

#### "and" *(ET logique)*

```python
age = 22
# Si age compris entre 18 et 25 ans
if (age >= 18 and age <= 25):
    print ("Vous avez entre 18 et 25 ans")

```

#### "or" *(OU logique)*

L'un ou l'autre mais pas les deux

```python
age = 17
derogation = True

if (age >= 18 or derogation == True):
    print ("Vous avez au moins 18 ans OU une dérogation.")

```

#### not

**not** (NON): Inverser le résultat d'un booleen 

```python
error = False

print(error) # False
print(not error) # True

# off = False, on = True
bouton_on_off = False
if bouton_on_off == False:
    bouton_on_off = True
else:
    bouton_on_off = False
    
# bouton_on_off = not False
# bouton_on_off = True
bouton_on_off = not bouton_on_off

# bouton_on_off = not True
# bouton_on_off = False
bouton_on_off = not bouton_on_off


error = False

# if error == True:
if error:
    print("Il y a une erreur, on quitte.")


# if error == False:
# if not False:
# if True:
if not error:
    print("Il n'y a pas d'erreur, on peut continuer")

```

## TPs:

##### Déclaration de variables

```python
print(" Déclaration de variables ")

# Déclarer une variable qui s'appellera 'nb' et contiendra le nombre entier 13.
nb = 13
print("La variable nb est de type: ", type (nb))

# déclarer une variable 'nb2' qui, contiendra le nombre flottant (a virgule) 15,5
nb2 = 15.5
print("La variable nb2 est de type: ", type (nb2))

# déclarer une variable 'b', qui prendra la valeur : true
b = True

# déclarer une variable 'language' qui aura pour valeur la chaîne de caractères 'python'.
language = "python"

# déclarer une variable 'z' qui aura la même valeur que nb, sans faire z = 13
z = nb

# le message 'hello world' si nb est supérieur ou égal à 4
if nb >= 4:
    print("Hello World ^^")



```

##### Mini Calculatrice

```python
print(" TP Mini Calculatrice ")

# demander à l'utilisateur de saisir un 1er nombre
nb1 = int(input ("Saisissez un premier nombre: "))
# demander à l'utilisateur de saisir un 2ème nombre
nb2 = int(input ("Saisissez un deuxième nombre: "))
# additionner les nombres et afficher le résultat
resultat_addition = nb1 + nb2
print("Le résultat de :", nb1, "+", nb2, "=", resultat_addition )

```

##### Convertir des pouces en centimètres

```python
print(" TP: Convertir des pouces en centimetres ")

# TP: Convertir des pouces en centimetres
# demander à l'utilisateur de saisir des pouces
pouces = float(input ("Saisissez le nombre de pouces: "))
# 1" (1 pouce) = 2,54 centimètres
# https://www.pouce-cm.fr/
centimetres = 2.54 * pouces
print (pouces, "pouces est égal à :", centimetres, "centimètres")

```

##### Convertir des heures en minutes

```python
print(" TP: Convertir des heures en minutes ")
# TP: Convertir des heures en minutes
# demander à l'utilisateur de saisir des heures
heures = int(input ("Saisissez un nombre d'heures (entier): " ))
# demander à l'utilisateur de saisir des minutes
minutes = int(input("Saississez un nombre de minutes (entier): "))
# convertir les heures & minutes en minutes (ex: 1h30 = 90 minutes)
minutes_uniquement = heures * 60 + minutes
print ("Résultat uniquement en minutes: ", minutes_uniquement)

```

##### Convertir des °C en °F

```python
print(" TP: Convertir des degres Celcius en degrès Fahrenheit")
# TP: Convertir des degres Celcius en degrès Fahrenheit
# https://www.metric-conversions.org/fr/temperature/fahrenheit-en-celsius.htm
# demander à l'utilisateur de saisir des degres celcius
degrees_celsius = float(input("Saisissez une température en °C: "))
# convertir les °C en °F
degrees_fahrenheit = degrees_celsius * 1.8 +32
print (degrees_celsius, "°C est égal à :", degrees_fahrenheit, "Fahrenheit")

```

##### Demander à l'utilisateur ce qu'il veut faire

**Sujet:** 

Afficher un message à l'utilisateur pour savoir s'il souhaite
    1- Convertir des pouces en centimètres
    2- Convertir des centimètres en pouces
    3- Quitter
Si l'utilisateur saisit 1:
     * Demander a l'utilisateur de saisir un nombre: "Nombre de pouces: "
     * on convertit
     * on affiche le resultat
Si l'utilisateur saisit 2:
     * Demander a l'utilisateur de saisir un nombre: "Nombre de centimètre: "
     * on convertit
     * on affiche le resultat
Sinon on affiche:
     * Je n'ai pas compris


```python
print(" TP: Afficher un message à l'utilisateur pour savoir s'il souhaite...")


print ("1. Convertir des pouces en centimètres ")
print ("2. Convertir des centimètres en pouces")
print ("3. Quitter")
choix = int(input ("Que voulez-vous faire ?  "))

if choix == 1:
    pouces = float(input ("Saisissez le nombre de pouces: "))
    centimetres = 2.54 * pouces
    print (pouces, "pouces est égal à :", centimetres, "centimètres")

elif choix == 2:
    centimetres = float(input ("Saisissez le nombre de centimètres: "))
    pouces = centimetres / 2.54
    print (centimetres, "centimètres est égal à :", pouces, "pouces")

# elif choix == 3:

else:
    print("Je n'ai pas compris :(")



```


##### BONUS

**Sujet:** 

- En partant d'une heure et de minutes données
- ex: heure = 2 et minutes = 45
- Si on ajoute 30 minutes, au minutes, on obtient 3h15

```python
print(" TP: Bonus")


heures = int(input ("Saisissez un nombre d'heures (entier): " ))
minutes = int(input("Saississez un nombre de minutes (entier): "))
minutes_add = int(input("Saisissez un nombre de minutes à rajouter (entier): "))

minutes_uniquement = heures * 60 + minutes + minutes_add
float(minutes_uniquement)

heures_resultat = minutes_uniquement // 60
minutes_resultat = minutes_uniquement % 60

if heures_resultat > 24:
    jours_resultat = heures_resultat // 24
    heures_resultat_modulo = heures_resultat % 24
    print("Résultat en jour, heures, minutes: ")
    print ("    ", jours_resultat, "jour(s)", heures_resultat_modulo, "heure(s) et", minutes_resultat, "minute(s)")
else:
    print ("Résultat en heure et minutes: ")
    print ("    ", heures_resultat, "heure(s) et",minutes_resultat, "minute(s)")



```

<iframe src=2021-07-26-POEI-Python/2021-07-26_17h39_25.mp4> </iframe>










Utiliser les boucles et tests pour réaliser des algorithmes
Se servir des tableaux, algorithmes divers de traitement de données massives
Types de données et opérations avancées (ensembles, dictionnaires,ordonnancement...)
Gestion des exceptions

## Atelier : Multiples algorithmes pour maitriser la syntaxe de base.

 
# Structurer le code avec des fonctions

Intérêt des structurations du code dans le projet et pour le groupe de projets
Créer et organiser les fonctions
Retour des fonctions, absence de retour, multiples retours et intérêt dans un algorithme complexe
Espaces de noms, manipulation
Créations de bibliothèques de fonctions, documentation
Opérations les chaînes de caractères
Calculer avec Python
Gestion des dates, heures, intervalles de temps avec Python
Fonctions diverses nécessaires

## Atelier : Construction d'une bibliothèque de fonctions

 
# Maîtriser l'Objet et modéliser une implémentation

Différents styles de programmation, apports de l'objet
Objet et classes
Gestion des attributs et méthodes
Instanciation, destruction
Encapsuler les données et utiliser des propriétés
Agrégation d'objets
Héritage simple et multiples
Polymorphisme
Introspection
Utilisation d'interfaces

 
# Manipuler des données

Manipulation de fichiers
Parsing Xml, JSON
Gestion des logs avec Python
Documentation du code et génération de rendu HTML
Utiliser des bases de données avec Python, DBAPI

## Atelier : Manipulation de fichiers et opérations liées à une base de données SQLite.



# Construire une interface graphique

Bibliothèques graphiques en Python
Tkinter vs PyQT ou autre
Widgets graphiques
Menus
Positionnement des composants
Gestion des fenêtres
Gestion des évènements

## Atelier : Implémentation d'une interface graphique complète d'une application