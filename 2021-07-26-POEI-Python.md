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

![](2021-07-26-POEI-Python/2021-07-26_17h39_25.gif)


## Formatage

On peut formater les données directement dans le programme:

```python
age = 64
prenom = "Maude"

print("Age: " + str(age) + ", prenom: " + prenom)
# print("Age =", age) 

# fstring (Format String): à partir python 3.6
print(f"Age: {age}, prenom: {prenom}")

# A partir de python 3
print("Age: {}, prenom: {}".format(age, prenom))

# Avant python 3
print("Age: %d, prenom: %s" % (age, prenom))


rue = "1 rue bidon"
code_postal = 75015

adresse = rue + ',' + str(code_postal)
print(adresse)

adresse = f"{rue},{code_postal}"
print(adresse)

```


## Boucles

Utiliser les boucles et tests pour réaliser des algorithmes.

### While

#### Compteur

Exemple avec un compteur:

```python
compteur = 1
while compteur <=10:
    print (f"Ligne {compteur}: Je ne dois pas recopier sans comprendre")
    compteur = compteur + 1

```

##### Résultat

![](2021-07-26-POEI-Python/2021-07-27_09h43_37.gif)


#### Parcourir une chaîne de caractères


```python
print("____ Parcourir une chaine ______")

prenom = "David"

# On commence toujours à 0
print("Lettre: " + prenom[0] )
print("Lettre: " + prenom[1] )


compteur = 0
while compteur < 5:
    print("Lettre: " + prenom[compteur] )
    compteur += 1

```

##### Résultat

![](2021-07-26-POEI-Python/2021-07-27_10h14_23.gif)


### For

```python
print("____ Parcourir une chaine avec un for ______")

# La boulce for est plutôt utilisée pour parcourir les séquences.
# Elle permet de parcourir automatiquement la chaine de caracteres
# du début jusqu'à la fin. Pour chaque tour de boucle si la variable
# 'lettre' n'existe pas elle sera créée, sinon on ecrase la valeur
# précédente par la nouvelle valeur 

# for ma_variable in prenom:
    # print(ma_variable)

for lettre in prenom:
    print("Lettre: " + lettre)
    
    
print("--- Pour aller plus loin ----")

for lettre in prenom:
    print("Lettre: " + lettre)
    if lettre == 'qwqw':
        break # <- quitte la boucle même si elle n'est pas finie.
    if lettre == " ":
        continue # passe au prochain tour de boucle sans executer ce qu'il y a en dessous
else:
    print("à la fin de la boucle.")
    del lettre # supprime la variable lettre

# for nombre in range(10):
for nombre in range(1, 11): # suite de nombre de 1 jusqu'à 11 non inclus
    print(f"Ligne {nombre}: Je ne dois pas recopier sans comprendre")

```


## TP: ex2.py


Exercice:

- reprendre le convertisseur Heure -> minutes de 02-Operateurs
- Faire une boucle: tant que l'utilisateur ne tape pas 2, on continue la boucle
- Dans cette boulce on met:
    - Afficher un message à l'utilisateur pour savoir s'il souhaite
        - 1- Convertir
        - 2- Quitter
- Si l'utilisateur saisit 1:
      * demander à l'utilisateur de saisir des heures
      * demander à l'utilisateur de saisir des minutes
      * convertir les heures en minutes
      * afficher le resultat
- Sinon si l'utilisateur saisit 2:
        * afficher au revoir
- Sinon:
        * afficher au je n'ai pas compris


```python
choix = 0
while choix != 2:
    print ("""
    
    Que voulez-vous faire ?
                1. Convertir
                2. Quitter

    """)
    choix = input("Votre choix: ")
    if choix == "1":
        heures = input("Saisir des heures: ")
        minutes = input("Saisir des minutes: ")
        heures = int(heures)
        minutes = int(minutes)
        resultat = heures * 60 + minutes
        print(f"{heures}h{minutes} = {resultat} minutes")
        # choix = 0
    elif choix >= "3":
        print ("Je n'ai pas compris")
    else:
        print ("Au revoir")
        break
```




Se servir des tableaux, algorithmes divers de traitement de données massives
Types de données et opérations avancées (ensembles, dictionnaires,ordonnancement...)
Gestion des exceptions
<!-- 
## Atelier : Multiples algorithmes pour maitriser la syntaxe de base. -->

 
# Les Fonctions

- Intérêt des structurations du code dans le projet et pour le groupe de projets
- Créer et organiser les fonctions
- Retour des fonctions, absence de retour, multiples retours et intérêt dans un algorithme complexe
- Espaces de noms, manipulation
- Créations de bibliothèques de fonctions, documentation
- Opérations les chaînes de caractères
- Calculer avec Python
- Gestion des dates, heures, intervalles de temps avec Python
- Fonctions diverses nécessaires

## Fonctions Simples

Les fonctions permettent de factoriser du code
Les variables stockent une valeur
Les fonctions stockent des instructions
 
<div class=info> DRY: Don't Repeat Yourself </div>

Un exemple:

```python
# Création/Définition de la fonction
def hello():
    # bloc d'instructions
    print("Hello")
    print("Tout")
    print("Le")
    print("Monde")


# Il faut appeller la fonction pour qu'elle s'execute.
hello()
# ... 
hello()

```

Un autre exemple: 

```python
# Pour un élève trop souvent puni, on serait obligé de copier/coller les boucles.
def faire_punition_simple():
    compteur = 1
    while compteur <= 10:
        print(f"Ligne {compteur}: Je ne dois pas recopier sans comprendre")
        # compteur += 1
        compteur = compteur + 1 # CTRL + C: pour arrêter une boucle infinie

faire_punition_simple()
print("On continue")
faire_punition_simple()

```

## Fonctions avec Paramètres

Exemple:

```python
def faire_punition(combien_de_fois):
    print (f"Combien de fois: " {combien_de_fois})
    compteur = 1
    while compteur <= combien_de_fois:
        print(f"Ligne {compteur}: Je ne dois pas recopier sans comprendre.")
        compteur += 1

# Faire punition 10 fois
faire_punition(10)
# Faire punition 15 fois
faire_punition(15)
# Faire punition 20 fois
faire_punition(20)

```

### Plusieurs Paramètres

On peut définir plusieurs paramètres:

```python
def faire_punition_multi_params(combien_de_fois, message):
    print(f"Combien de fois: {combien_de_fois}")
    print(f"{message=}")
    compteur = 1
    while compteur <= combien_de_fois:
        print(f"Ligne {compteur}: {message}")
        compteur += 1
        
faire_punition_multi_params(15, "Je ne dois pas faire ça")
faire_punition_multi_params(3, "Je ne dois pas faire ci")

```

### Avec input

Exemple avec `input`:

```python
# Définition fonction paramètre avec input
def faire_punition_input():
    combien_de_fois = int(input(f"Combien de fois:   "))
    # print (f"Combien de fois:  {combien_de_fois}")
    compteur = 1
    while compteur <= combien_de_fois:
        print(f"Ligne {compteur}: Je ne dois pas recopier sans comprendre.")
        compteur += 1

# Appel fonction paramètre avec input
faire_punition_input()

```


## Fonction avec valeur(s) de retour

### EX3.PY

```python
# Faire une fonction qui affiche 'Hello World !'
def say_hello():
    print('Hello World !')

# Faire une fonction qui prend un paramètre 'prenom' et affiche Bonjour suivi du prénom
def say_hello_you(prenom):
    print(f"Bonjour {prenom} !")


# Faire une fonction qui affiche la multiplication de 2 nombres passés en paramètres
def multiplication(nombre, nombre2):
    # resultat = nombre * nombre2
    print(f"{nombre} x {nombre2} = {nombre * nombre2}")

multiplication(5, 7)

# Faire une fonction qui renvoie la soustraction de 2 nombres passés en paramètre
def soustraction(nombre, nombre2):
    # resultat = nombre - nombre2
    return (nombre - nombre2)

resultat = soustraction(7, 5)
print(f"{resultat=}")


# Faire une fonction qui affiche la table de multiplication d'un nombre passé en paramètre
def afficher_table(nombre, max=10):
    compteur = 0
    while compteur <= max:
        resultat = nombre * compteur
        print(f"{nombre} x {compteur} = {resultat}")
        compteur += 1    
    # for multiplicateur in range(11):
    #     print(f"{nombre} x {multiplicateur} = {multiplicateur * nombre}")

afficher_table(5)
afficher_table(5, 20)

# Faire une fonction qui convertit des heures en minutes, elle prend 2 arguments: heures et minutes.
# exemple: how_many_minutes(heure, minutes): #...
# exemple d'appel: how_many_minutes(1,30)  <- renvoie 90
def how_many_minutes(heures, minutes):
    return heures * 60 + minutes

resultat = how_many_minutes(1, 30)
print(f"{resultat=} minutes")


# Faire une fonction qui cherche une lettre dans une chaine de caractères et qui retourne "trouvée" si la lettre a été trouvée
# et 'aucun résultat' dans le cas contraire.
# find_char(chaine, lettre) : #...
# exemple d'appel: find_char("Salut tout le monde", 'u') <- cherche la lettre 'u' dans la chaine
# etape 1: faire la fonction find_char(chaine,letter)
# indice: une boucle et un if sont necessaires

def find_char(chaine, lettre_recherche):
    compteur = 0
    taille_chaine = len(chaine)
    while compteur < taille_chaine:
        lettre_actuelle = chaine[compteur]
        if lettre_actuelle == lettre_recherche:
            print("Trouvée")
            break
        compteur += 1
    else:
        print("Aucun résultat")

find_char("Salut tout le monde", 'u')
find_char("Salut tout le monde", 'w')



def find_char_for(chaine, lettre_recherche):
    for lettre_actuelle in chaine:
        if lettre_actuelle == lettre_recherche:
            return "Trouvée" # on quitte la fonction
    return "Aucun résultat"


print( find_char_for("Salut tout le monde", 'u') )
print( find_char_for("Salut tout le monde", 'w') )

resultat = 'u' in "Salut tout le monde"
print(resultat)

if "u" in "Salut tout le monde":
    print("Il y a un u")
    

# Exercice bonus:
# faire un rot 11
# Un rot est un algorithme qui décale les lettres pour chiffrer un message.
# "Le texte chiffré s'obtient en remplaçant chaque lettre du texte clair original par une lettre à distance fixe, toujours du même côté, dans l'ordre de l'alphabet.
# Pour les dernières lettres (dans le cas d'un décalage à droite), on reprend au début."" Wikipedia
# A + 11 = L
# Z + 11 = K
# "Salut"  devient "Dlwfe"
#  indice: ord(letter) pour convertir un caractère en nombre (table ASCII)
#  indice: chr(ascii) pour convertir du code ASCII en caractère
#  indice: il faut parcourir la chaine caractère par caractère et la transformer
# verifier : https://rot13.com/
# table ascii https://fr.wikibooks.org/wiki/Les_ASCII_de_0_%C3%A0_127/La_table_ASCII#Descriptif3
# chiffrement par decalage: https://fr.wikipedia.org/wiki/Chiffrement_par_d%C3%A9calage


def rot11(message):
    ROT = 11
    MIN_CHAR_UPPER = 65 # A
    MAX_CHAR_UPPER = 90 # Z
    MIN_CHAR_LOWER = 97 # a
    MAX_CHAR_LOWER = 122 # z
    hidden_msg = ""
    for letter in message:
        char = ord(letter) # 83
        if (char >= MIN_CHAR_LOWER and char <= MAX_CHAR_LOWER):
            hidden_msg += chr((((char - MIN_CHAR_LOWER) + ROT) %
                              26) + MIN_CHAR_LOWER)
        elif (char >= MIN_CHAR_UPPER and char <= MAX_CHAR_UPPER):
            # 83 - 65 = 18 
            # 18 + 11 = 29 
            # 29 % 26 = 1 et il reste 3
            # 3 + 65 = 68 = D
            hidden_msg += chr((((char - MIN_CHAR_UPPER) + ROT) %
                              26) + MIN_CHAR_UPPER)
    return hidden_msg


print(rot11("Salut"))
print(rot11("AazZYyBb"))


def rot(chaine): 
    chaine = chaine.lower()
    phrase_codee = ""
    for lettre in chaine :
        nombre = ord(lettre)
        #print(nombre)
        clef = 11
        nombre2 = nombre + clef
        if nombre2 > 123 :
            nombre2 = (nombre2 - 122) + 96
        #print(nombre2)
        code = chr(nombre2)
        #print(code)
        phrase_codee = str(phrase_codee)+str(code)
    print(f"Phrase chiffrée : {phrase_codee}")


rot("Salut")

```


# Listes

Les listes permettent de regrouper un ensemble de données cohérentes.

Initialisation d'une liste:

```python
notes = [] # Liste vides
print(notes)

```

Avec des valeurs:

```python
notes[2, 6, 7, 9]
print(notes)
```

## liste.py

```python
# Les listes permettent de regrouper un ensemble de données cohérents
# Liste de prenoms, liste de notes, liste de courses

# note1 = 1
# note2 = 3

# liste vide
notes = []
print(notes)

notes = [2,6,7,9]
print(notes)

liste = [2,6,7,9, True, "Salut !", [0, 2]]

# On commence toujours à 0
print(f"Première note: { notes[0] }")
print(f"Deuxième note: { notes[1] }")

# notes[4] # il y a 4 notes mais la dernieres est à l'index 3 -> IndexError: list index out of range

taille_notes = len(notes)
print(f"Il y a {taille_notes} notes")


# print(f"Dernière note: { notes[4 - 1] }")
# print(f"Dernière note: { notes[3] }")
print(f"Dernière note: { notes[taille_notes - 1] }")
# Python autorise les index négatifs, on part de la fin de la liste
print(f"Dernière note: { notes[-1] }")
print(f"L'avant dernière note: { notes[-2] }")

# notes[-5] <- il n'y a pas 5 notes

notes[0] = 7
print(notes)

# On ne peut pas faire ca avec les chaine de caractères
# Car les chaine de caractères ne sont pas des sequences modifiables.

prenom = "Anne"
# prenom[2] = 'o' <- TypeError: 'str' object does not support item assignment

liste = [prenom, 'Salut']
print(liste)


print("----- Parcourir une liste -----")

index = 0 # ou i
taille_notes = len(notes)
while index < taille_notes:
    note = notes[index]
    print(f"Note: {note}")
    index += 1

print("Avec un for ")

for note in notes:
    print(f"Note: {note}")

```





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






--- 


# *Tips & Tricks*

## Raccourcis Visual Studio

- `Ctrl+/`: commente/décommente une ou plusieurs lignes

- Ctrl+