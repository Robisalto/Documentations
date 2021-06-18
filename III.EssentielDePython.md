---
title: III. L'essentiel de Python
subtitle: Devenir un développeur Python (26 Academy)
author: David DEBRAY - <a href="Index_des_Documentations.html">Index des Documentations</a>
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# I. Aborder Python
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I. Aborder Python.mp4" type="video/mp4">
</video>
</p>

## I-I. Profiter des fichiers d'exercise
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-I. Profiter des fichiers d'exercice.mp4" type="video/mp4">
</video>
</p>

## I-II. Découvrir Python <p style="align-content: center;"> <video width="600" height="337" controls> <source
src="III.EssentielDePython\I-II. Découvrir Python.mp4" type="video/mp4"> </video> </p>

## I-III. Choisir son environnement de développement intégré
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-III. Choisir son environnement de développement intégré.mp4" type="video/mp4">
</video>
</p>

## I-IV. Utiliser Python comme une calculatrice
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-IV. Utiliser Python comme une calculatrice.mp4" type="video/mp4">
</video>
</p>

## I-V. Définir la notion de variable
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-V. Définir la notion de variable.mp4" type="video/mp4">
</video>
</p>

## I-VI. Aborder la logique booléenne
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-VI. Aborder la logique booléenne.mp4" type="video/mp4">
</video>
</p>

## I-VII. S'initier à la conversion de type
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-VII. S'initier à la conversion de type.mp4" type="video/mp4">
</video>
</p>

## I-VIII. Effectuer des opérations booléenne dans Python
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-VIII. Effectuer des opérations booléenne dans Python.mp4" type="video/mp4">
</video>
</p>

## I-IX. Ecrire un script dans Python
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-IX. Ecrire un script dans Python.mp4" type="video/mp4">
</video>
</p>

## I-X. Découvrir la méthode ``print()``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\I-X. Découvrir la méthode print().mp4" type="video/mp4">
</video>
</p>

# II. Débuter avec les structures de contrôle et les fonctions
## II-I. Aborder la structure conditionnelle en ``IF``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-I. Aborder la structure conditionnelle en IF.mp4" type="video/mp4">
</video>
</p>

## II-II. Aborder la structure conditionelle en ``if``, ``elseif``, ``else``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-II. Aborder la structure conditionelle en if, elseif, else.mp4" type="video/mp4">
</video>
</p>

## II-III. Travailler avec la structure d'itération ``while``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-III. Travailler avec la structure d'itération while.mp4" type="video/mp4">
</video>
</p>

## II-IV. Découvrir la structure d'itération ``for``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-IV. Découvrir la structure d'itération for.mp4" type="video/mp4">
</video>
</p>

## II-V. Utiliser les instructions ``break`` et ``continue``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-V. Utiliser les instructions break et continue.mp4" type="video/mp4">
</video>
</p>

## II-VI. Comprendre la notion de fonction sans paramètre d'entrée
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-VI. Comprendre la notion de fonction sans paramètre d'entrée.mp4" type="video/mp4">
</video>
</p>

## II-VII. Définir une fonction avec un paramètre d'entrée
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-VII. Définir une fonction avec un paramètre d'entrée.mp4" type="video/mp4">
</video>
</p>

## II-VIII. Définir une fonction avec un paramètre de retour
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-VIII. Définir une fonction avec un paramètre de retour.mp4" type="video/mp4">
</video>
</p>
> **Attention à la portée globale d'une variable**

```python
# Portée globale d'une variable
rayon = 10
def valeurRayon():
    global rayon
    rayon=20
    print("La valeur du rayon dans la fonction est :",rayon)
# !!! La valeur "10" sera utilisée par le programme !!! #
```

## II-IX. Utiliser la fonction ``lambda``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-IX. Utiliser la fonction lambda.mp4" type="video/mp4">
</video>
</p>

## II-X. Manipuler les Listes
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-X. Manipuler les listes.mp4" type="video/mp4">
</video>
</p>

## II-XI. Manipuler les Tuples
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-XI. Manipuler les Tuples.mp4" type="video/mp4">
</video>
</p>
> **Un tuple est IMMUABLE!!! et plus rapide à executer qu'une liste.**

[Manipuler les Tuples.py](III.EssentielDePython\II-XIII. Manipuler les Tuples.py)

## II-XII. Utiliser les Dictionnaires
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\II-XII. Utiliser les Dictionnaires.mp4" type="video/mp4">
</video>
</p>

# III. Comprendre la programmation orientée objet et le fonctionnement des classes
## III-I. Utiliser les méthodes natives de Python
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-I. Utiliser les méthodes natives de Python.mp4" type="video/mp4">
</video>
</p>

## III-II. Aborder la notion d'objet
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-II. Aborder la notion d'objet.mp4" type="video/mp4">
</video>
</p>

  ```python
    # Creation de Class
    class nomExpliciteDeClass: 

    # Exemple de Class
    class Rectangle(object):         # Définition
        "Classe de rectangle"
        def __init__(self, longueur =0, largeur =0): # CONSTRUCTEUR
            self.cetteLongueur = longueur
            self.cetteLargeur = largeur
            self.ceNom ="rectangle"
  ```

## III-III. Fragmenter son projet
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-III. Fragmenter son projet.mp4" type="video/mp4">
</video>
</p>

- Un fichier "main.py" va servir pour appeler les différentes classes.
- Chaque Classes est séparées dans un fichier différent
- Pour appeler les classes dans le fichier MAIN, on utilise:

  ```python
      from NomDuFichierClass import NomDeLaClasse
  ```

## III-IV. Définir une classe
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-IV. Définir une classe.mp4" type="video/mp4">
</video>
</p>

## III-V. Utiliser des constructeurs, des accesseurs et des mutateurs
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-V. Utiliser des constructeurs, des accesseurs et des mutateurs.mp4" type="video/mp4">
</video>
</p>

## III-VI. Comprendre l'héritage de classe
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-VI. Comprendre l'héritage de classe.mp4" type="video/mp4">
</video>
</p>

## III-VII. Aborder le Polymorphisme
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-VII. Aborder le Polymorphisme.mp4" type="video/mp4">
</video>
</p>

## III-VIII. Gérer les paramètres ``ARGS`` et ``KWARGS``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-VIII. Gérer les paramètres ARGS et KWARGS.mp4" type="video/mp4">
</video>
</p>

 > **Note:** Permet de passer des arguments à une fonction dynamiquement sans connaître à l'avance le nombre de paramètres. (Pas besoin de tout réécrire).

## III-IX. Définir les exceptions
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-IX. Définir les exceptions.mp4" type="video/mp4">
</video>
</p>

## III-X. Gérer les exceptions
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-X. Gérer les exceptions.mp4" type="video/mp4">
</video>
</p>

Pour signaler une exception ``raise``:
```python
def maFonction(parametre):
    if parametre not in (1, 2, 3):
        raise ValueError("'parametre' ne peut prendre que les valeurs 1, 2 ou 3.")
# RAISE permet de signaler une erreur (exception)
```

Gérer des exceptions ``try/except``:
```python
def plusieursExceptions():
    try:
        return menbreDeLaFamille[100 / ma_variable2]
    # Est exécuté pour ces deux exceptions
    except (IndexError, ZeroDivisionError):
        return print("Aïe, division par 0 et un index inconnu")
    # Est exécuté pour cette exception
    except TypeError:
        print("Houlaaa, c'est quoi cette histoire ? Mon indice est un float !")
# 
```

Si tout c'est bien passé on met à la fin du test:
```python
# code...
#else est le bloc exécuté si aucune exception n’est levée :
    else:
        print('En fait, tout va bien.')

```

Forcer un message à la fin:
```python
# code...
finally:
        print("Finalement, c'est Flash que je préfére !")

```

## III-XI. Découvrir le principe des décorateurs
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-XI. Découvrir le principe des décorateurs.mp4" type="video/mp4">
</video>
</p>

```python
# ------- Définition des Fonctions ------- #
# Fonction Décorateur "Vérification"
def verification(fonction):
  def wrapper(*args, **kwargs):
    for valeur in args:
      if(type(valeur) is not int):
        raise TypeError("L'un des paramètres n'est pas un entier!")
    return fonction(*args, **kwargs)
  return wrapper


# Appel du décorateur
@verification
def addition(nombre1, nombre2):
    return nombre1 + nombre2

# ------- Programme ------- #
resultat = addition(1, "2")
print("L'addition donne:", resultat)

```

## III-XII. Stocker dans des fichiers
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-XII. Stocker dans des fichiers.mp4" type="video/mp4">
</video>
</p>

Import des modules:
```python
# -----------------------------------------------
#       Zone des 'imports' de modules
# -----------------------------------------------

import os
import os.path  # Importation de la bibliothèque os.path pour utiliser la fonction getsize()
```

Créer un fichier:
```python
def creer_fichier(nom_fichier):
    f = open(nom_fichier,"w")  # L'ouverture du fichier en mode écriture.
                                # Si le fichier existe son contenu sera écrasé sinon il sera créé.
                                # Python va générer une erreur (exception) si le fichier en cours
                                # d'utilisation par une autre application ou s'il est ouvert.
    f.close()
```

Exemple:
```python
# Permet de choisir le répertoire de contenu du fichier
os.chdir("C:/Denis")
print(os.getcwd())      # Permet de voir le chemin d'accès du répertoire de travail
f=open("texte1.txt","w") # Ouverture du fichier texte1 en mode écriture... Ce sont des / et non des \ comme dans Windows
# Si le fichier existe son contenu sera écrasé, sinon il sera créé.
# "w" est le mode d'accès en écriture.
# Python va générer une erreur (exception) si le fichier est en cours d'utilisation par une autre application ou s'il est ouvert.
# texte1.txt est le nom physique du fichier.
# f est le nom logique du fichier
ligne='Vive la formation sur Python 3.\n'
ligne2="Votre formateur est ravi de vous accompagner dans cette formation !"
f.write(ligne) # La méthode write permet d'écrire un texte dans le fichier f (1 seul paramètre).
f.write(ligne2)
f.close() # Fermeture du fichier
```

## III-XIII. Comprendre les itérateurs et les énumérateurs
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-XIII. Comprendre les itérateurs et les énumérateurs.mp4" type="video/mp4">
</video>
</p>

## III-IV. Créer un exécutable sous Windows
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-IV. Créer un exécutable sous Windows.mp4" type="video/mp4">
</video>
</p>

## III-V. Exporter de Python et importer dans un tableur
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\III-V. Exporter de Python et importer dans un tableur.mp4" type="video/mp4">
</video>
</p>

## III-VI. Chapter Quizz
1. Pour exporter vers Excel, il faut exporter en format _. `.CSV`
2. Le module cxFreeze permet de . `créer un exécutable`
3. Pour créer une classe itérable, on implémente les méthodes iter() et _. `next()`
4. Pour se positionner dans un répertoire, on utilise la méthode _. `os.chdir()`
5. Un décorateur applique _ sur une fonction. `une fonction`
6. Pour gérer les exceptions, on peut utiliser la structure _. `try...except`
7. Sur les listes, on peut recevoir une exception de type _. `IndexError`
8. Le paramètre *args se comporte comme _. `un tuple`
9. Le polymorphisme va de pair avec l'héritage. `VRAI`
10. Une classe peut _ d'une autre. `hériter`
11. Les variables de l'objet sont disponibles à l'intérieur de l'objet en les préfixant par le mot-clé `self`
12. Vous pouvez commenter votre classe avec des _. `docstrings`

```python
def kos_root():
    """Return the pathname of the KOS root directory."""
    global _kos_root
    if _kos_root: return _kos_root
    ...
```

1. Pour créer une classe de base, on peut la faire dériver de la classe _. `object`
2. Les variables membres d'une classe sont appelées des _. `attributs`
3. La méthode native qui permet de trier une liste s'appelle _. `sorted()`

# IV. Construire un interface graphique sous Tkinter
## IV-I. Insérer des widgets sous Tkinter
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-I. Insérer des widgets sous Tkinter.mp4" type="video/mp4">
</video>
</p>

## IV-II. Découvrir des widgets pour les textures
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-II. Découvrir des widgets pour les textures.mp4" type="video/mp4">
</video>
</p>

## IV-III. Installer d'autres widgets
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-III. Installer d'autres widgets.mp4" type="video/mp4">
</video>
</p>

## IV-IV. Mettre en page une fenêtre graphique
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-IV. Mettre en page une fenêtre graphique.mp4" type="video/mp4">
</video>
</p>

## IV-V. Ajouter des alertes sous forme de boite de message
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-V. Ajouter des alertes sous forme de boite de message.mp4" type="video/mp4">
</video>
</p>

## IV-VI. Gérer l'interactivité avec des widgets
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-VI. Gérer l'interactivité avec des widgets.mp4" type="video/mp4">
</video>
</p>

## IV-VII. Utiliser les canvas
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-VII. Utiliser les canvas.mp4" type="video/mp4">
</video>
</p>

## IV-VIII. Créer un jeu de tir
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-VIII. Créer un jeu de tir.mp4" type="video/mp4">
</video>
</p>

## IV-IX. Découvrir la bibliothèque Turtle
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-IX. Découvrir la bibliothèque Turtle.mp4" type="video/mp4">
</video>
</p>

> **Doc:** Turtle documentation
> [https://docs.python.org/3.2/library/turtle.html](https://docs.python.org/3.2/library/turtle.html)

## IV-X. Aborder un programme de jeu
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-X. Aborder un programme de jeu.mp4" type="video/mp4">
</video>
</p>

## IV-XI. Jouer avec le temps et animer simplement
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-XI. Jouer avec le temps et animer simplement.mp4" type="video/mp4">
</video>
</p>

## IV-XII. Installer Page 4.10
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-XII. Installer Page 4.10.mp4" type="video/mp4">
</video>
</p>

## IV-XIII. Construire une interface graphique et générer du code
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-XIII. Construire une interface graphique et générer du code.mp4" type="video/mp4">
</video>
</p>

## IV-XIV. Effectuer une complétion avec un code d'interaction
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\IV-XIV. Effectuer une complétion avec un code d'interaction.mp4" type="video/mp4">
</video>
</p>

## IV-XV. Chapter Quizz
1. Le widget Messagebox comporte la méthode _. `askyesno`
2. Une zone de texte à saisir est un widget _. `Entry`
3. Page permet de faire _. `de la conception graphique`
4. Pour remplir avec une couleur, on utilise la méthode _. `fill()`
5. Pour importer des images, on utilise la méthode _. `PhotoImage()` 👎
6. Le module Turtle est destiné aux _. `Enfants`
7. Le module _ permet de générer des valeurs aléatoires. `Random`
8. Le canevas est défini en pixels. `VRAI`
9. Pour définir qu'une barre de menu n'est pas détachable, on donne la valeur 0 à son paramètre _. `tearoff` 👎
10. On peut définir un paramètre _ sur un objet Button. `Message` 👎
11. Les objets de cadre sont de type _. `Frame`
12. Parmi les widgets graphiques, on trouve _.  `Scale`
13. Pour lancer une fenêtre graphique, on utilise la méthode _. `mainloop()`
14. Tkinter est basé sur _. `TCL`

# V. Exploiter la Data Science avec Python
## V-I. Utiliser les tableaux de données
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-I. Utiliser les tableaux de données.mp4" type="video/mp4">
</video>
</p>

## V-II. Passer en revue quelques notions mathématiques
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-II. Passer en revue quelques notions mathématiques.mp4" type="video/mp4">
</video>
</p>

## V-III. Utiliser les fonctions de base de ``NumPy``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-III. Utiliser les fonctions de base de NumPy.mp4" type="video/mp4">
</video>
</p>

## V-IV. Définir les lignes trigonométriques
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-IV. Définir les lignes trigonométriques.mp4" type="video/mp4">
</video>
</p>

## V-V. Travailler avec les nombres complexes
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-V. Travailler avec les nombres complexes.mp4" type="video/mp4">
</video>
</p>

## V-VI. Résoudre une matrice
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-VI. Résoudre une matrice.mp4" type="video/mp4">
</video>
</p>

## V-VII. Gérer des fichiers avec ``NumPy``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\" type="video/mp4">
</video>
</p>

## V-VIII. Aborder la bibliothèque ``SymPy``
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\V-VIII. Aborder la bibliothèque SymPy.mp4" type="video/mp4">
</video>
</p>

> **Documentation:**
> [https://docs.sympy.org/latest/tutorial/](https://docs.sympy.org/latest/tutorial/)

## V-IX. Chapter Quizz
1. Avec la bibliothèque SymPy, on peut effectuer _. `de la simplification d'expression fractionnelle`
2. La méthode save() de NumPy crée un fichier d'extension _. `.npy`
3. Une matrice nulle se crée avec la méthode NumPy matlib._. `zeroes{}`
4. Les définitions de fonction peuvent être surchargées. `VRAI`
5. Le _ d'un nombre complexe, c'est mettre la valeur imaginaire négative. `Conjugé`
6. La méthode math.degrees() demande des _. `radians`
7. Pour arrondir avec NumPy, on utilise la méthode _. `around()` 👎
8. Un nombre complexe comporte une partie _. `imaginaire`
9. Pour définir le type d'un tableau NumPy, on utilise le paramètre _. `dtype`

# VI. Construire une interface graphique sous PyQt5
## VI-I. Installer PyQt5 et Qt Designer
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-I. Installer PyQt5 et Qt Designer.mp4" type="video/mp4">
</video>
</p>

## VI-II. Créer une fenêtre sous PyQt5
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-II. Créer une fenêtre sous PyQt5.mp4" type="video/mp4">
</video>
</p>

## VI-III. Utiliser des widgets sous PyQt5
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-III. Utiliser des widgets sous PyQt5.mp4" type="video/mp4">
</video>
</p>

## VI-IV. Disposer des widgets
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-IV. Disposer des widgets.mp4" type="video/mp4">
</video>
</p>

## VI-V. Créer une interaction
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-V. Créer une interaction.mp4" type="video/mp4">
</video>
</p>

## VI-VI. Créer des messagebox dans PyQt5
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-VI. Créer des messagebox dans PyQt5.mp4" type="video/mp4">
</video>
</p>

## VI-VII. Découvrir le widget Slider
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-VII. Découvrir le widget Slider.mp4" type="video/mp4">
</video>
</p>

## VI-VIII. Utiliser le widget checkbox
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-VIII. Utiliser le widget checkbox.mp4" type="video/mp4">
</video>
</p>

## VI-IX. Utiliser le widget Radiobutton
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-IX. Utiliser le widget Radiobutton.mp4" type="video/mp4">
</video>
</p>

## VI-X. Sauvegarder un fichier
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-X. Sauvegarder un fichier.mp4" type="video/mp4">
</video>
</p>

## VI-XI. Tirer parti du widget Menubar
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-XI. Tirer parti du widget Menubar.mp4" type="video/mp4">
</video>
</p>

## VI-XII. Utiliser QtDesigner pour son interface
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-XII. Utiliser QtDesigner pour son interface.mp4" type="video/mp4">
</video>
</p>

## VI-XIII. Charger son interface à la volée dans Python
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\VI-XIII. Charger son interface à la volée dans Python.mp4" type="video/mp4">
</video>
</p>

## VI-XIV. Chapter Quizz
1. Une boîte de dialogue PyQt5 provient de la classe mère _. `QDialog`
2. Avec PyQt5, on peut positionner des objets dans un _. `GridLayout`
3. Dans les menus, on ajoute des _. `actions`
4. On peut récupérer le contenu d'une zone d'édition avec la méthode _. `toPlainText()`
5. En PyQt5, il faut créer des groupes de boutons radio. `FAUX`
6. Pour définir le texte d'une zone de saisie, on utilise la méthode _. `setText`
7. Parmi les widgets de compteurs, on trouve _. `QLCDNumber`
8. Le widget qui permet l'édition d'un texte s'appelle _. `QLineEdit`
9. Pour ajouter une interaction à un bouton, on crée _. `une connexion`
10. PyQt5 comporte un système de grilles explicite. `FAUX`
11. PyQt5 est composé de _. `QtWidgets`
12. Pour utiliser PyQt5, il faut instancier un objet _. `QApplication`
13. PyQT permet de créer _. `des interfaces graphiques`

# Conclusion
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="III.EssentielDePython\Conclusion.mp4" type="video/mp4">
</video>
</p>

## Certification
<p style="text-align: center; text-decoration-color: red">
  [CertificateOfCompletion_Lessentiel de Python 3.pdf](III.EssentielDePython\CertificateOfCompletion_Lessentiel de Python 3.pdf)
</p>


---

<p style="text-align: center"> [Template - Version PDF](template.pdf) </p>

---

