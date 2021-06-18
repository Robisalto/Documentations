---
title: POEI DevOps - Linux 
author: Bruno GUERIN 
date: 2021-06-07
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

## Formation Linux Administration: Bases et Services

Animée par Bruno GUERIN de DAWAN Toulouse, 35H du 07/06/21 au 11/06/21.
(bguerin@dawan.fr)
Formateur Dawan (Linux, réseau et bases de données)

### Le groupe:

#### Akim
Cursus microbiologie
Connaissances/niveaux Linux : C2I (HTML,CSS), WAMP, quelques notions

#### Alicia
Chimie des matériaux - 6 mois ingénieure matériaux
Connaissances/niveaux Linux : pas grand chose, qqs en Unix et bases en Python

#### Blaise-Maël
Doctorat en physique nucléaire. Souhait en data-science/analyste (C++, compilation)
Connaissances/niveaux Linux : Base utilisation, Shell (bash)

#### Chafea
Docteur en mécanique énergétique
Connaissances/niveaux Linux : thèse avec Fortran, notions Linux
Reconversion vers le numérique

#### Charles
Ingénieur en génie des matériaux
Envie d'autre chose
Approche des micro-controleurs : Arduino
Nano-compteur : Raspberry
Un peu de PowerBI

#### David Debray
Administrateur systèmes et réseaux
Connaissances Linux, Raspberry et shell

#### David Pineda
Docteur en mathématiques
Connaissances/niveaux Linux : bases de l'utilisation

#### Erwan
Communication (graphisme)
Consultant en BI
Un peu de Linux et de Shell et de beaucoup de choses.

#### Loubna
Formation informatiques (M2 développement logiciel)
Domaine de l'assurance
Reconversion informatique : développeur web (angular, js, java)
Connaissances/niveaux Linux : Niveau utilisation

#### Margaux
Doctorat chimie analytique
Reconversion informatique
Connaissances/niveaux Linux : pas de Linux, codage sur R

#### Ouardia
Docteur génie civil
Connaissances/niveaux Linux : utilisation à la fac, bases SQL

#### Anne
Docteur en chimie organique, enseignement
Connaissances/niveaux Linux : utilisation à la fac

#### Valentin
Ingénierie des matériaux
Chargé d'affaires
Reconversion
Connaissances/niveaux Linux : pas de compétence Linux, VBA et Python

#### Vincent
Master en biotechno
Enseignement 5 ans
Reconversion
Formation 5 mois data analyst (Python , SQL)
Souhait de relation client
Connaissances/niveaux Linux : rien à part le mot Linux


---

# Installation de l'environnement de travail

- Virtualbox
- Debian VM: <https://mensuel.framapad.org/p/bsmgy3csgj-9nvn?lang=fr>

# Présentation de Linux
## Qu'est-ce que Linux ?

Noyau d'un système d'exploitation. 
Pour trouver le noya sur un système on tape: `ls -l /boot`, on voie: `vmlinuz-4.19.0-13-amd64` qui est le noyau.

1. Noyau /Kernel: dans ``/boot/vm*`` 
```
stagiaire@debian:~$ ls /boot/vmlinuz-4.19.0-13-amd64
/boot/vmlinuz-4.19.0-13-amd64
```

2. Librairies, dans ``/lib*``

3. Processus

![](2021-06-07-POEI-Linux\noyau.png)

![](https://arles-linux.org/wp-content/uploads/2019/01/racine.jpg)


## Historique
L'histoire débute en 1991 des suites des travaux du Finlandais Linus Torvalds dans la création d'un noyau pour un futur système d'exploitation. Il s'est inspiré très largement du modèle Unix. Aujourd'hui Linux est considéré non pas comme un Unix-based mais comme un Unix-Like.
Aujourd'hui et depuis longtemps Linux a acquis ses lettres de noblesse dans le monde informatique et est un OS alternatif parfaitement crédible.

Le nom Linux vient bien évidemment du prénom de son auteur originel à qui un proche a fait remarque l'étrange proximité phonétique avec le terme Unix.

## Modèle UNIX
Unix a été originellement conçu autour des principes suivants :

- Small is beautiful
- Ensemble de processus, chaque processus ne faisant qu'une chose mais bien
- Mécanisme de redirection d'E/S : association de processus
- Tout est flux/suite d'octets non structuré

## Caractéristiques de Linux

- 32 et 64 bits
- Multithreading par défaut
- Multi-utilsateurs
- Multi-architectures
  + Intel/AMD
  + ARM
  + Sparc (SUN Oracle)
  + Apollo (Compaq/HP)
  + POWER (IBM)
  + PPC (Apple/Motorola)
  + etc.

- La plus petite machine Linux: <http://www.picotux.com/>
- Le plus gros: <https://top500.org/lists/top500/2020/11/>

## Linux & l'OpenSource
Bien que soumis à la GPL (issue du projet GNU) le noyau Linux ne fait pas partie de l'écosystème GNU, il le complète. Certains se battent pour que l'on d'un OS GNU/Linux.

# Connexion et premières commandes
Linux étant un système multi-utilisateur, la connexion au système nécessite une phase d'identification (login) et d'authentification (password par défaut) à l'issue de laquelle on est connecté et en contact à l'aide d'un shell.
Shell : coquille (en anglais), interface entre le système et l'utilisateur.

**Notion de prompt :**
Aujourd'hui le prompt par défaut d'une majorité de distributions (Installation de Linux : Debian, Ubuntu, Redhat, ...) indique

- le nom de l'utilisateur
- le hostname : nom de la machine (rien à voir avec le nom de la distribution)
- la localisation du répertoire courant au sein de l'arborescence
- Le caractère ``~`` (tilde) indique la racine du répertoire personnel de l'utilisateur

<p class=info> la commande pwd permet toujours de savoir où l'on est. </p>

## Structure de la ligne de commande
Toute ligne de  commande débute par le nom d'une commande (ex. date, whoami, logname, ...). On peut donc dire que les commandes ont généralement un comportement par défaut. Vouloir modifier le comportement par défaut se fait à l'aide d'option(s) ou arguments transmis à celle-ci.
Exemple de la commande date
Celle-ci affiche la date et l'heure locales (selon le fuseau horaire).
L'option -u donne l'heure UTC (date et heure internationales).

Une option permet donc d'adapter le comportement d'une commande à un besoin précis. Une option est généralement introduite  par un '-' suivi d'une lettre (ex. -u)


<div class="info">
- la même option dans deux commandes différentes n'implique le même comportement
- l'option -r de la commande ls inverse le sens de l'affichage
- l'option -r de la chmod implique la récursivité de la commande
- le même comportement dans deux commandes différentes peut être déclenché par deux options différentes
- la récursivité dans la commande ls est réalisée par l'option -R
- la récursivité dans la commande chmod est réalisée par l'option -r
</div>

Toujours, en cas de doute, consulter l'aide en ligne de la commande (man ls)

```bash=
# Consulter le MANUEL d'une commande:
man ls

# Regarder l'HELP d'une commande:
ls --help
```

Une commande peut également être enrichie par des arguments ou imposer leur présence.

Une commande peut également être enrichie par des arguments ou imposer leur présence.
Un argument est une information à partir de laquelle va travailler un processus :

- nom de l'utilisateur dont veut les informations
- nom du compte que l'on veut créer
- nom du fichier à supprimer
- ...

<div class=info> 
Certaines commandes comme **id** ne demmande pas d'argument.

Au contraire, d'autre commandes comme **rm** nécessitent un ou plusieurs arguments
</div>

<div class=warning> Bien faire la différence entre option **courte** ``-`` et option **longue** ``--`` </div>

```bash=
ls --directory # Affiche uniquement les répertoires

ls -directory # Affiche ls avec les options -d -i -r -e -c -t -o -r -y
```

Contrevenants à cette distinction option courte (un tiret)/option longue (2 tirets)

- commande dd: dd if=... of=... conv=... count=...
- commande find: find -name "..." -type ...


NB : ici en ligne signifie l'aide disponible à partir de la ligne de commande ou tout autre manière d'y accéder (ex. firefox help:ls -> l'aide installée sur le système.

## Consulter le MAN

- Pour consulter le **man** de ls: ``man ls``

- Pour consulter un **numéro de section spécifique** comme passwd(5): ``man 5 passwd``

- Pour** naviguer** dans le man: 
  + b: *backwards*
  + f: *forward*

- **Recherche** dans le man: 
  + ``/chaine`` + Enter
  + ``n``: occurence suivante
  + ``N``: occurence précédente
  + ``?chaine`` sens de recherche inversé

- Rechercher les différents manuels par mot-clés: man`` -k mot-clé``
  + Ou ``apropos mot-clé``

Exemple: 

```bash=
# man -k remove
# -------
stagiaire@debian:~$ man -k remove
remove-shell (8)     - Supprimer des interpréteurs de la liste des interpréteurs initiaux valables
aa-remove-unknown (8) - remove unknown AppArmor profiles
colrm (1)            - remove columns from a file
cut (1)              - remove sections from each line of files
delgroup (8)         - remove a user or group from the system
deluser (8)          - remove a user or group from the system
ipcrm (1)            - remove certain IPC resources
kernel-install (8)   - Add and remove kernel and initramfs images to and from /boot
modprobe (8)         - Add and remove modules from the Linux Kernel
psfstriptable (1)    - remove the embedded Unicode character table from a console font
py3clean (1)         - removes .pyc and .pyo files
pyclean (1)          - removes .pyc and .pyo files
remove-default-ispell (8) - remove default ispell dictionary
remove-default-wordlist (8) - remove default wordlist
rm (1)               - remove files or directories
rmdir (1)            - remove empty directories
rmmod (8)            - Simple program to remove a module from the Linux Kernel
unlink (1)           - call the unlink function to remove the specified file
update-rc.d (8)      - install and remove System-V style init script links
```

```bash=
# apropos remove
# -------
stagiaire@debian:~$ apropos remove
remove-shell (8)     - Supprimer des interpréteurs de la liste des interpréteurs initiaux valables
aa-remove-unknown (8) - remove unknown AppArmor profiles
colrm (1)            - remove columns from a file
cut (1)              - remove sections from each line of files
delgroup (8)         - remove a user or group from the system
deluser (8)          - remove a user or group from the system
ipcrm (1)            - remove certain IPC resources
kernel-install (8)   - Add and remove kernel and initramfs images to and from /boot
modprobe (8)         - Add and remove modules from the Linux Kernel
psfstriptable (1)    - remove the embedded Unicode character table from a console font
py3clean (1)         - removes .pyc and .pyo files
pyclean (1)          - removes .pyc and .pyo files
remove-default-ispell (8) - remove default ispell dictionary
remove-default-wordlist (8) - remove default wordlist
rm (1)               - remove files or directories
rmdir (1)            - remove empty directories
rmmod (8)            - Simple program to remove a module from the Linux Kernel
unlink (1)           - call the unlink function to remove the specified file
update-rc.d (8)      - install and remove System-V style init script links

```

<div class=warning> Bien vérifier la date du MAN !  Certaines traductions ne sont pas à jour... Ils peut y avoir des manques </div>

### Micro QUIZZ MAN

<div class=question> Dans quelle sections trouve-t-on les entrées des commandes suivantes: </div>
  - <span class=question> hostname: </span>
  - <span class=answer> man hostname = 1 </span>
  - <span class=question> ip: </span>
  - <span class=answer> man ip = 8 </span>
  - <span class=question> find: </span>
  - <span class=answer> man find = 1 </span>
  - <span class=question> tcp: </span>
  - <span class=answer> man tcp = 7 </span>


<div class=question>  Quel est l'intitulé de la section 7 ? </div>
<div class=answer> man man: 7 ==>>  Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7) </div>


<div class=question> Comment avoir l'équivalent en anglais ? </div>
<div class=answer> LANG C man man </div>


<div class=question> La commande ``hostname`` se suffit-elle à elle-même ? </div>
<div class=answer> oui </div>

<div class=question> Quel est le rôle de l'éventuel argument de cette commande ? </div>
<div class=answer> Modifier le hostname courant (de manière non persistente). </div>


## Propriétées des objets

Informations sur les objets : ``ls -alh``

```bash=
stagiaire@debian:~$ ls -alh
total 28K
drwxr-xr-x 2 stagiaire stagiaire 4,0K juin   7 17:09 .
drwxr-xr-x 3 root      root      4,0K déc.   9 08:59 ..
-rw-r--r-- 1 stagiaire stagiaire  220 déc.   9 08:59 .bash_logout
-rw-r--r-- 1 stagiaire stagiaire 3,5K déc.   9 08:59 .bashrc
-rw------- 1 stagiaire stagiaire   41 juin   7 17:08 .lesshst
-rw-r--r-- 1 stagiaire stagiaire  807 déc.   9 08:59 .profile
-rw------- 1 stagiaire stagiaire  104 juin   7 17:09 .Xauthority
```

**De la droite vers la gauche :**

- nom des objets, par ordre alphabétique croissant

- la date de **dernière modification** (autres dates : date de dernièr accès (ls -lu), date de dernière modification des attributs (ls -lc) )

- taille des fichiers en **octets** (l'option ``-h`` permet de convertir la taille en l'unité la plus appropriée : K, M, G, ...)

- le groupe propriétaire de l'objet

- le propriétaire de l'objet

- le nombre de liens physiques (nombre de noms permettant d'accéder à l'objet)

- la nature (premier caractère) de l'objet et les droits d'accès (9 caractères suivants)
  - Nature
    - un tiret (**-**)  indique un fichier standard (ayant un contenu exploitable : texte, image, son, vidéo, data, ...
    - **d** : répertoire
    - **l** : lien symbolique (notion assez proche de la notion de raccourci sous Windows)
    - **p** : tube nommé (mécanisme de communication unidirectionnelle inter-processus (/dev/initctl)
    - **s**: socket unix (mécanisme de communication bidirectionnelle) (/run/dbus/system_bus_socket)
    - **b** : fichier d'interface avec le matériel en mode bufferisé (/dev/sda)
    - **c** : fichier d'interface avec le matériel, en accès direct (/dev/tty1)

- Droits d'accès:
  + 3 droits de l'user propriétaire (**U**ser)
  + 3 droits du groupe propriétaire (**G**roup)
  + 3 droits des autres utilisateurs (**O**ther)

A retenir: **UGO**


# Les INODES 
## Que sont les inodes sous Linux?

Un inode est une structure de données. Il définit un fichier ou un répertoire sur le système de fichiers et est stocké dans l’entrée de répertoire. Les inodes pointent vers les blocs qui composent un fichier. L’inode contient toutes les données administratives nécessaires à la lecture d’un fichier. Les métadonnées de chaque fichier sont stockées dans des inodes dans une structure de table.


## Quel est le numéro d’inode?

![](https://www.telephonetecno.com/wp-content/uploads/2020/12/1607932976_662_Que-sont-les-inodes-sous-Linux-et-comment-sont-ils-utilises.jpg)

Chaque inode de la structure Linux a un numéro unique qui lui est identifié. Il est également appelé numéro d’index et possède les attributs suivants:

- Taille
- Propriétaire
- Date / heure
- Autorisations et contrôle d’accès
- Emplacement sur le disque
- Types de fichier
- Nombre de liens
- Métadonnées supplémentaires sur le fichier

Pour vérifier la liste des numéros d’inœuds, utilisez la commande suivante: ``ls -i``

<div class=info> Un fichier peut avoir **plusieurs nom différents** *(pièce d'identité)* mais **une inode unique** *(numéro de sécu)* </div>

<https://telephonetecno.com/que-sont-les-inodes-sous-linux-et-comment-sont-ils-utilises/>

## Gestion des Liens Physiques/Symboliques
La gestion est réalisée à l'aide de la commande ``ln`` (link).
Il n'est possible de créer des liens physiques :

- qu'au sein du même système de fichiers (espace des inodes)

- qu'avec des fichiers et non des répertoires (seul le noyau le peut)

Ces deux limitations peuvent être dépassées à l'aide des liens symboliques.

![](2021-06-07-POEI-Linux\inode.png)

# Gestion des droits d'accès
## Significarion des 3 droits
### Lecture *(read)*
- **Fichier**: Accès en lecture à son contenu.
- **Répertoire**: Accès en lecture à son contenu, liste des objets contenus dans le répertoire.

### Ecriture *(write)*
- **Fichier**: Modification du contenu d'un fichier. 
<span class=warning> Le droit d'écriture n'implique pas forcément le droit de lecture! </span>

- **Répertoire**:  Modification du contenu du répertoire : ajouter/supprimer des objets dans le répertoire
<span class=warning> Attention le droit d'écriture sur un **répertoire** permet de ajouter/supprimer n'importe quel fichier/dossier **indépendament des droits sur le fichier !!!** </span>


### Execution
- **Fichier**: Droit de lancer un processus à partir d'un fichier (exécutable).
- **Répertoire**: 


### "Vérouiller/Bloquer" un fichier 

**Empêcher la suppression/modification d'un fichier par root**

Pour empêcher la modification ou la suppression d’un fichier, y compris pour root, on peut utiliser la commande « chattr » qui permet de mettre en place des attributs avancés sur les fichiers.

Pour bloquer un fichier :

```bash
chattr +i fichier
```

Pour voir les attributs avancés d’un fichier :

```bash
lsattr
----i----------- ./fichier
```

Pour débloquer un fichier:

```bash
chattr -i fichier
```


## Modification des droits

Commande `chmod [-R]`  Qui Action Quoi Liste des objets subissant l'action.

### Synatxe avec Notation Symbolique

Qui : u, g, o, ug, uo, ugo (a)
Action : +, -, =
Quoi : r, w, x, u, g, o, X, s, t

### Syntaxe avec Notation Octale

chmod [-R] XYZ liste des objets subissant l'action

x = 1
w = 2
r = 4

## Droits par défaut
Le noyau Linux attribue :

- les droits 666 à tout fichier à l'issue de sa création

- les droits 777 à tout répertoire à l'issue de sa création


Ce comportement est tempéré par l'existence du masque par défaut contenant la liste des droits à ne pas positionner sur les objets lors de leur création. Ce masque est défini au niveau de la session et est accessible  et modifiable par la commande `umask`.

La commande `umask` seule affiche la valeur du masque courant.
La commande `umask` XYZ modifie le masque (cette modification ne persiste que jusqu'à la fin de la session).

### Les masques les plus courants :

- Masque minimum standard : `0022` 
  - fichiers: rw-r--r-- / 644
  - répertoires: rwxr-xr-x / 755


- Masque un peu plus sécure : `0027` 
  - fichiers: rw-r----- / 640
  - répertoires: rwxr-x--- / 750


- Masque encore plus sécure : `0077`
  - fichiers: rw------- / 600
  - répertoires: rwx------ / 700


## Droits étendus

<div class=question> En tant que l'utilisateur stagiaire, vous est-il possible de lire le contenu du fichier /etc/shadow ? </div>
<div class=answer> Non, car n'étant ni root ni membre du groupe shadow, on ne dispose pas du droit de lecture. Ce que confirme la commande ``cat /etc/shadow``. </div>


<div class=question> Pourquoi la commande cat n'a-t-elle pas accès au fichier /etc/shadow alors que la commande passwd y a accès quant à elle ? </div>
<div class=answer> voir les droits sur /usr/bin/passwd... </div>

![](2021-06-07-POEI-Linux\droitetendu.png)


### Droit SetUID (4)
Se manisfeste par le caractère `'s'` au niveau du x du propriétaire d'un exécutable.

### Droit SetGID (2)
Se manifeste par le caractère `'s'` au niveau du x du groupe d'un exécutable ou d'un répertoire.

### Sticky Bit (1)
Limite le droit d'écriture dans sa fonction de suppression aux seuls objets dont on est propriétaire.

Donne aux utilisateurs le droit d'écriture dans le répertoire, mais **ils ne peuvent pas supprimer de fichiers dont il ne sont pas propriétaires**.


Se manifeste par le caractère `'t'` au niveau du x de *other* sur un répertoire.

Les droits étendus se nottent avec le premier chiffre dans le cas d'une notation octale sur 4 chiffres.


## Micro-Quizz

<div class=question> Transformer les notations symboliques suivantes en notations octales: </div>

```bash=
- rwxrwxrwx => 777

- rwxr-xr-x => 755

- r-x-w---x => 521

- --x--x--x => 111

- --------- => 000
```

Droits étendus:
```bash=
- rwsr-sr-x => 6755

- rwxrwxrwt => 1777

- rwxrwxrwT => 1776
```

- On additionne les `s` *user* et *group* entre eux, `s`(user)=4 et `s`(group)=2

- `t` vaut 1


<div class=question>  Transformer les notations octales suivantes en notation symboliques </div>

```bash=
- 777 => rwx rwx rwx

- 755 => rwx r-x r-x

- 775 => rwx rwx r-x

- 302 => -wx --- -w-

- 644 => rw-r--r--

- 600 => rw-------

- 601 => rw------x
```



<span class=info> Au cas où: <https://chmod-calculator.com/> </span>


<div class=question> Quels masques permettraient  d'obtenir les droits par défaut suivants ? </div>


```bash=
- Fichier : 666 (répertoire : 777) => umask 0000

- Fichier : 640 (répertoire : 750) => umask 0027

- Fichier : 664 (répertoire : 775) => umask 0002

- Fichier : 600 (répertoire : 700) => umask 0077

- Fichier : 400 (répertoire : 500) => umask 0277
```

Par défaut: `777` **répertoires** et `666` **fichiers**.



# Débuter avec le Shell
## Notion de Shell
C'est le processus servant d'interface entre l'utilisateur et le système. Il s'agit d'un nom générique pour les différents programmes ayant servi de shell tout au long de l'histoire d'Unix/Linux.
Premier shell d'Unix : Shell Thompson
Premier shell "évolué" : Bourne Shell (Steve Bourne) (System V - ATT)
Shell de la branche BSD : C-Shell
Évolution du Bourne Shell : Korn Shell
Sous Linux, le shell par défaut est le ***Bash*** : Bourne Again Shell (quasi compatible avec le Korn Shell).
D'autres aiment utiliser le ZSH, un autre shell disponible sur Linux.

Petite histoire des langages :
Initialement Unix a été écrit en BCPL. UN nouveau langage plus adapté a été créé : le langage B. Ce langage a été remanié en un nouveau langage : le langage C.


## Prompt
Contient un certain nombre d'informations définies dans la variable PS1 (voir la section PROMPTING dans le man de bash pour plus d'infos). Toute modification de cette variable est perdue à la fin de la session sauf a être conservée dans l'un des fichiers de configuration du shell (cf. plus loin).

Il est possible de modifier le prompt en utilisant la variable `PS1`.

```bash=
stagiaire@debian:~$ echo $PS1
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$
```

Pour plus d'informations, voir: 

```bash=
When executing interactively, bash displays the primary prompt
PS1 when it is ready to read a command, and the secondary prompt
PS2 when it needs more input to complete a command.  Bash
       displays PS0 after it reads a command but before executing it.
       Bash displays PS4 as described above before tracing each command
       when the -x option is enabled.  Bash allows these prompt strings
       to be customized by inserting a number of backslash-escaped
       special characters that are decoded as follows:
              \a     an ASCII bell character (07)
              \d     the date in "Weekday Month Date" format (e.g., "Tue
                     May 26")
              \D{format}
                     the format is passed to strftime(3) and the result
                     is inserted into the prompt string; an empty format
                     results in a locale-specific time representation.
                     The braces are required
              \e     an ASCII escape character (033)
              \h     the hostname up to the first `.'
              \H     the hostname
              \j     the number of jobs currently managed by the shell
              \l     the basename of the shell's terminal device name
              \n     newline
              \r     carriage return
              \s     the name of the shell, the basename of $0 (the
                     portion following the final slash)
              \t     the current time in 24-hour HH:MM:SS format
              \T     the current time in 12-hour HH:MM:SS format
              \@     the current time in 12-hour am/pm format
              \A     the current time in 24-hour HH:MM format
              \u     the username of the current user
              \v     the version of bash (e.g., 2.00)
              \V     the release of bash, version + patch level (e.g.,
                     2.00.0)
              \w     the current working directory, with $HOME
                     abbreviated with a tilde (uses the value of the
                     PROMPT_DIRTRIM variable)
              \W     the basename of the current working directory, with
                     $HOME abbreviated with a tilde
              \!     the history number of this command
              \#     the command number of this command
              \$     if the effective UID is 0, a #, otherwise a $
              \nnn   the character corresponding to the octal number nnn
              \\     a backslash
              \[     begin a sequence of non-printing characters, which
                     could be used to embed a terminal control sequence
                     into the prompt
              \]     end a sequence of non-printing characters

```

<https://man7.org/linux/man-pages/man1/bash.1.html>


## Alias
Un alias est une sorte de raccourci sur une commande.
Par exemple :

`alias diso='date "+%F %T"'`

Un alias n'est défini que le temps de la session, pour le conserver il est nécessaire de le faire persister dans l'un des fichiers de configuration.

La commande `alias` seule donne la liste des alias courants
La commande `unalias` est utilisée pour supprimer un alias.

## Enchaînement de commandes

On va parler ici d'**enchaînement séquentiels** et pas d'exécution en parallèle.

### Enchaînement inconditionnel

Le point-virgule `;` permet un enchaînement **inconditionnel** de plusieurs commandes :

`cmd1 ; cmd2 ; cmd3...`

Les commandes sont séquentiellement exécutées, indépendamment de leur statut de fin.
Si la commande 1 ne fonctionne pas les commandes suivantes seront quand même exécutées.

![](2021-06-07-POEI-Linux\enchainementcommande.png)

### Enchaînement conditionnel

- La syntaxe `cmd1 && cmd2` indique de lancer la cmd2 **uniquement sur réussite** de la commande précédente.

- La syntaxe `cmd1 || cmd2` indique de lancer la cmd2 **uniquement sur échec** de la commande précédente.



### Enchainement avancé
Il est possible de mélanger les deux types:

![](2021-06-07-POEI-Linux\enchainementConditionnel.png)

<div class=warning> Faire bien attention à l'enchaînement des commandes pour éviter les bêtises... </div>


### Micro-QUIZZ

<span class=question> Dans quelles situations la commande cmd3 sera-t-elle lancée ? </span>


```bash
cmd1 && cmd2 && cmd3 :
```
<div class=answer> il faut que cmd1 et cmd2 réussissent </div>


```bash
cmd1 || cmd2 || cmd3 :
```
<div class=answer> il faut que cmd1 et cmd2 échouent toutes les deux </div>


```bash
cmd1 && cmd2 || cmd3 : il faut que cmd1 OK et cmd2 KO

```
<div class=answer> cmd1 échoue OU cmd2 échoue. </div>


```bash
cmd1 && cmd2 || cmd3 : il faut que cmd1 OK et cmd2 KO

```
<div class=answer> cmd1 KO ET cmd2 OK  OU  cmd1 OK ET cmd2 KO </div>



## Redirection d'E/S

Les canaux d'E/S (Entrée / Sortie)

Toute commande peut disposer des canaux d'E/S suivants :

- 0 : canal d'entrée
- 1 : canal de sortie des résultats
- 2 : canal d'erreur

![](2021-06-07-POEI-Linux\redirectionES.png)

n°`>` fichier : redirection du canal n° vers le fichier.

- si le fichier n'existe pas, il est créé
- si le fichier existe, son contenu est écrasé par le résultat de la commande
- si le n° du canal n'est pas précisé, il s'agira du canal 1

n° `>>` fichier : redirection en ajout du canal n° vers le fichier

- si le fichier n'existe pas, il est créé
- si le fichier existe, le résultat de la commande y est ajouté à la fin


**Toutes les commandes disposent d'un canal d'erreur.**

- Certaines commandes n'ont **que le canal de sortie**
  - ls
  - date
  - who
  - echo

- Certaines commandes n'ont **que le canal d'entrée**
  - lp
  - write
  - wall

- Certaines commandes ont **les trois canaux** (on appelle ces commandes des **filtres**)
  - cat
  - cut
  - grep
  - wc
  - tr


### Canal d'entrée

Le canal est à ne pas confondre avec la ligne de commande et notamment les arguments.
Le canal d'entrée est le moyen par lequel le shell transmet un flux d'octets vers le processus. Il ne s'agit donc pas d'argument (un argument est une information à partir de laquelle va travailler un processus : nom de fichier, un nom d'utilisateur, une date, une chaîne).


### Gestion des redirections d'entrée

#### Redirection simple

Redirection vers, ou à partir de fichier.
 
```bash
cmd < fichier

***Here Document (plus utilisé dans les scripts)***

cmd << EOF
...
...
...
EOF
```

### Redirection vers ou à partir d'une commande

Pour rediriger le résultat d'une commande dans une autre commande, on utilise le ***pipe***: `|`

Exemple:

```bash
# Nombre de lignes contenues dans le fichier /etc/passwd
cat /etc/passwd | wc -l

```


## Caractères spéciaux

Les caractères spéciaux sont des caractères déclenchant un traitement particulier de la part du Shell. Ceux-ci sont recherchés une fois la commande validée et en amont de son exécution.


- Caractères de redirection : `<,<<,>,>>,<|, |`
- Caractères de protections : `"...", '...', \`

- "..." : protection faible (protège de tout sauf des constructions à base de $)
- '...' : protection forte (protège de tout)
- \caractère : déspécialise le caractère immédiatement suivant
- Modèles de noms de fichiers
- * : n'importe quelle chaîne de caractères, y compris la chaîne vide
- b*c : bc bac banc blanc broc "b                       c"
- ? : n'importe quel caractère

- ls -l j?.sh

- [...] : un seul caractère, parmi ceux de la liste entre crochets

- ls -l j[3456].sh

- [^...] : un seul caractère, hormis ceux de la liste entre crochets (peut être écrit [!...])

- ls -l j[^3456].sh

- Il y en a d'autres : (), [], [[]], (()), {}, &&, ||, &, 



##### Caractères spéciaux  Signification:

- `#`   Commentaire.
- `/`   Séparateur dans les chemins.
- `~`   Répertoire HOME.
- `$`   Substitution de valeur.
- ` `   Protection du caractère suivant.
- `'`   Guillemet (quote). Protection forte.
- `"`   Guillemet. Protection faible.
- `&`   Execution en arrière-plan.
- `<`   Redirection de flot d'entrée.
- `>`   Redirection de flot de sortie.
- `|`   Tube de flots d'entrée/sortie standards.
- `\`   protection du 1er caratère suivant


##### Les jokers Caractères Correspondance: 
- `?`   1 seul caractère quelconque.
- `*`   une suite de caractères quelconques (vide compris).
- `[ensemble]`  1 seul caractère qui existe dans l'ensemble.
- `[!ensemble]`   1 seul caractère qui n'existe pas dans l'ensemble.

Source: <http://www.progmatique.fr/article-50-Shell-liste-caracteres-speciaux-jokers.html>



### Micro-quizz sur les caractères spéciaux

<div class=question> Comment modéliser les noms de fichiers suivants : </div>

- Se terminant par **.sh** => `*.sh`

- Commençant par **u** => `u*`

- Commençant par une majuscule: `[A-Z]*`

- Commençant par un chiffre ou une minuscule et se terminant par .c: `[-az0-9]*.c` correspond à `abc...xyz0123...789`

- Contenant un chiffre en deuxième position: `?[0-9]*`



## Options
un option permet d'adapter le compoprtement du ***bash***.


**Options historiques** : se gèrent à l'aide de la commande set [+-]o
La liste et l'état des options est donnée par set -o.
Une option est activée par : set -o nom
Une option est désactivée par : set +o nom


### Options utiles

- **noclobber** : évite l'écrasement d'un fichier en cas de simple redirection
- **xtrace** : affiche les étapes de traitement d'une commande à l'écran
- **errexit** : stoppe un script en cas d'erreur
- **ignoreeof** : désactive la fonctionnalité de déconnexion de la combinaison ^D (EOF)
- **nounset** : provoque une erreur lors de l'accès à une variable non initialisée




### Options étendues

La commande shopt affiche les options étendues avec leur statut
Une option étendue est activée par shopt -s nom
Elle est désactivée par shopt -u nom

Les options étendues s'active avec la commande ***shopt***.

Voir: <https://www.computerhope.com/unix/bash/shopt.htm>



## Commandes Internes/Externes

Une commande **interne** (au shell) est une commande dont le code est **contenu dans le code du shell bash**. Son exécution se déroule au sein du processus bash.

Une commande **externe** est une commande dont le code se trouve dans un fichier de même nom que la commande (en cela il y a génération d'un processus).


<div class=info> La commande type permet de savoir si on a à faire à une commande externe ou interne en donnant la priorité aux commandes internes. </div>

```bash
# Commande Interne
type cd
cd est une primitive du shell

# Commande Externe
type tree
tree est /usr/bin/tree



```

## Fichiers de configuration
Plusieurs fichiers de configuration sont exploitables par le shell, dans l'ordre suivant lors de la connexion :

- `/etc/profile`: fichier global de configuration du Shell, ne peut être modififé que par le root.

```bash
stagiaire@debian:~$ cat /etc/profile
# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
...

```

Dans le répertoire personnel, le shell recherche l'un des fichiers suivants, il utilisera le premier trouvé :

- .bash_profile (généralement utilisé par les distributions Redhat)

- .bash_login

- .profile (généralement utilisé par les distributions Debian/Ubuntu)

Les Shells interactifs ouvert après la connexion exploitent le fichier `.bashrc`


## Gestion de l'historique
Le shell gère un historique des commandes saisies.
Pendant la session, l'historique conserve en mémoire un nombre de commandes indiqué par la variable HISTSIZE. Par défaut 1000 (sur Debian).

À la fin de la session, l'historique mémoire est persisté dans le fichier dont le nom est donné par la variable HISTFILE. Par défaut, il s'agit de .bash_history. Dans ce fichier sera conservé un nombre de commandes indiqué par la variable HISTFILESIZE. Par défaut 2000 (sur Debian).

La commande history permet l'affichage de l'historique de session.
Dès lors que la variable HISTTIMEFORMAT est définie, le shell stocke un horodatage pour chaque commande sous forme d'un timestamp UNIX (nombre de secondes écoulées depuis le 01 janvier 1970).



## Micro-TP sur le bash


Créer, de manière persistente, les alias suivants :

- Un alias nommé `'llt'` affichant le contenu d'un répertoire par ordre chronologique croissant (du plus ancien au plus récent)

```bash
echo "alias llt = 'ls -alrt'" >> ~/.bashrc && source .bashrc

stagiaire@debian:~$ llt
total 208
-rw-r--r-- 1 stagiaire stagiaire    807 déc.   9  2020 .profile
-rw-r--r-- 1 stagiaire stagiaire    220 déc.   9  2020 .bash_logout
drwxr-xr-x 3 root      root        4096 déc.   9  2020 ..
-rwxrwxrwx 1 stagiaire stagiaire     19 juin   7 17:46 bla.txt
drwxr-xr-x 3 stagiaire stagiaire   4096 juin   7 17:49 .local
-rw-r--r-- 1 stagiaire stagiaire     20 juin   8 10:29 f1.txt
drwxr-xr-x 3 stagiaire stagiaire   4096 juin   8 14:10 dir1
-rw-r--r-- 1 stagiaire stagiaire     42 juin   9 12:21 test.log
-rw-r--r-- 1 stagiaire stagiaire      0 juin   9 12:21 test.err
-rw------- 1 stagiaire stagiaire   1073 juin   9 16:33 .bash_history
-rw------- 1 stagiaire stagiaire    156 juin   9 16:33 .Xauthority
drwxr-xr-x 2 stagiaire stagiaire   4096 juin  10 09:18 Scripts
-rw------- 1 stagiaire stagiaire     89 juin  10 09:27 .lesshst
-rw-r--r-- 1 stagiaire stagiaire   3544 juin  10 10:04 .bashrc
drwxr-xr-x 5 stagiaire stagiaire 159744 juin  10 10:04 .

```


- Un alias nommé `'lls'` affichant le contenu d'un répertoire en fonction de la taille croissante, lisible de la manière la plus pratique (faire en sorte que la taille soit affichée avec le suffixe le plus approprié)

```bash
echo "alias lls = 'ls -alhrS'" >> ~/.bashrc && source .bashrc


stagiaire@debian:~$ lls
total 208K
-rw-r--r-- 1 stagiaire stagiaire    0 juin   9 12:21 test.err
-rwxrwxrwx 1 stagiaire stagiaire   19 juin   7 17:46 bla.txt
-rw-r--r-- 1 stagiaire stagiaire   20 juin   8 10:29 f1.txt
-rw-r--r-- 1 stagiaire stagiaire   42 juin   9 12:21 test.log
-rw------- 1 stagiaire stagiaire   89 juin  10 09:27 .lesshst
-rw------- 1 stagiaire stagiaire  156 juin   9 16:33 .Xauthority
-rw-r--r-- 1 stagiaire stagiaire  220 déc.   9  2020 .bash_logout
-rw-r--r-- 1 stagiaire stagiaire  807 déc.   9  2020 .profile
-rw------- 1 stagiaire stagiaire 1,1K juin   9 16:33 .bash_history
-rw-r--r-- 1 stagiaire stagiaire 3,5K juin  10 10:04 .bashrc
drwxr-xr-x 2 stagiaire stagiaire 4,0K juin  10 09:18 Scripts
drwxr-xr-x 3 stagiaire stagiaire 4,0K juin   7 17:49 .local
drwxr-xr-x 3 stagiaire stagiaire 4,0K juin   8 14:10 dir1
drwxr-xr-x 3 root      root      4,0K déc.   9  2020 ..
drwxr-xr-x 5 stagiaire stagiaire 156K juin  10 10:04 .

```


- Configurer votre environnement, de manière persistente, afin:
    - de protéger vos fichiers d'un écrasement intempestif lors de redirections


```bash
echo "set -o noclobber" >> ~/.bashrc && source .bashrc

stagiaire@debian:~$ echo "bla" > f1
stagiaire@debian:~$ >f1
-bash: f1 : impossible d'écraser le fichier existant


```


  - d'interdire la fin de session par la combinaison ^D

```bash
stagiaire@debian:~$ echo "set -o ignoreeof" >> ~/.bashrc
stagiaire@debian:~$ source .bashrc
stagiaire@debian:~$ Utilisez « logout » pour quitter le shell.

```

  - de définir l'umask à 0027

```bash
echo "umask 0027" >> ~/.bashrc && source .bashrc

 mkdir BOU && touch bou 

-rwxrwxrwx 1 stagiaire stagiaire     19 juin   7 17:46 bla.txt
-rw-r----- 1 stagiaire stagiaire      0 juin  10 10:39 bou
drwxr-x--- 2 stagiaire stagiaire   4096 juin  10 10:39 BOU
drwxr-xr-x 3 stagiaire stagiaire   4096 juin   8 14:10 dir1

```

# Les commandes essentielles

## Gestion de répertoires

- `mkdir` : création de répertoire. L'option `-p` permet de créer, le cas échéant, les répertoires parents.
- `rmdir` : suppression de répertoire à condition qu'il soit vide.


## Se déplacer et lister

- `cd` : change directory (cd - alterne entre le courant et le dernier ; cd seul retourne dans le home directory)
- `ls` : liste le contenu d'un répertoire ou la présence/info d'un fichier.

## Copier, déplacer et supprimer

- `cp` : copie fichiers/répertoires
- `mv` : déplace/renomme
- `rm` : supprime (de manière irréversible)

Ces trois commandes s'exécutent sans confirmation (l'option -i évite le risque de perte de fichier)

On utilise la récursivité avec l'option: `-r`


## Rechercher des fichiers/répertoires

*Ici on recherche indépendement du contenu.*

### La commande `Find`

- `find`: Permet de rechercher des objets, à partir d'un ou plusieurs répertoires, sur la base d'un ensemble de critères pour ensuite effectuer une ou plusieurs actions sur les objets trouvés.

```bash
# Syntaxe
find [-H] [-L] [-P] [-D debugopts] [-Olevel] [starting-point...] [expression]




# Recherche dans plusieurs répertoires
find rep1 rep2 ...

```

#### Recherche par ***type***
```bash
find -type [d|f]
## IS NOT:
find ! -type [d|f]


```
types:  f,d,l,s,p,b,c

#### Recherche par ***nom***

```bash
find -name "*.sh"
```

<span class=info> L'option `-name` doit s'utiliser toujours avec les guillements. </span>



#### Recherche par ***taille***

```bash
# Trouve les fichiers de plus de 20M:
find / -type f -size +20M -exec ls -lh {} \;


find / -type f -size +20M -type d \(! -name DATA\) -exec ls -lh {} \;
```

- -size x: exactement la taille
- -size +x: plus grand que x
- -size -x: plus petit que x


#### Recherche par ***user/group***

- -perm
- -user
- -group
- -nouser
- -nogroup


#### Exemples

Combiner, recherche de dossier dont le nom se fini par un chiffre:
```bash
find -type d -name "*[0-9]"
```

```bash
find / -xdev -type f -name "*.tmp" -atime +7 -exec rm {} \;

```

<span class=info> L'option `-atime` utilise des tranches de 24h, ci-dessus: *7x24h* </span>

<span class=info> L'option `-xdev` permet de rester sur le système de fichier courant (évite de parcourir les volumes montés) et permet donc une recherche beaucoup plus performante !!! </span>


### La commande `locate`: 


Recherche effectuée non pas à partir de l'arborescence mais auprès d'une base mise à jour quotidiennement (/var/lib/mlocate/mlocate.db).

```bash

stagiaire@debian:~$ ll /etc/cron.daily/
total 44K
652810 drwxr-xr-x  2 root root 4,0K juin  10 14:24 ./
652801 drwxr-xr-x 74 root root 4,0K juin  10 14:24 ../
657272 -rwxr-xr-x  1 root root  311 mai   19  2019 0anacron*
652848 -rwxr-xr-x  1 root root 1,5K mai   12  2020 apt-compat*
652990 -rwxr-xr-x  1 root root  355 déc.  29  2017 bsdmainutils*
652811 -rwxr-xr-x  1 root root 1,2K avril 19  2019 dpkg*
653039 -rwxr-xr-x  1 root root  377 août  29  2018 logrotate*
653404 -rwxr-xr-x  1 root root 1,1K févr. 10  2019 man-db*
652910 -rwxr-xr-x  1 root root  543 nov.  14  2018 mlocate*
652891 -rwxr-xr-x  1 root root  249 sept. 27  2017 passwd*
652995 -rw-r--r--  1 root root  102 oct.  11  2019 .placeholder

```


#### Installation:

```bash
root@debian:/home/stagiaire#  apt install mlocate

root@debian:/home/stagiaire# updatedb


stagiaire@debian:~$ locate bla
/etc/bindresvport.blacklist
/home/stagiaire/bla.txt
/usr/lib/modprobe.d/fbdev-blacklist.conf
/usr/lib/modules/4.19.0-13-amd64/kernel/drivers/media/pci/cx88/cx88-blackbird.ko
/usr/lib/modules/4.19.0-13-amd64/kernel/net/ipv4/tcp_hybla.ko
/usr/sbin/setvesablank
/usr/share/initramfs-tools/scripts/init-top/blacklist
/usr/share/man/man8/setvesablank.8.gz
/usr/share/mime/x-content/blank-bd.xml
/usr/share/mime/x-content/blank-cd.xml
/usr/share/mime/x-content/blank-dvd.xml
/usr/share/mime/x-content/blank-hddvd.xml
/usr/share/zoneinfo/Africa/Casablanca
/usr/share/zoneinfo/posix/Africa/Casablanca
/usr/share/zoneinfo/right/Africa/Casablanca


```

#### Avantage/Inconvénient

- Avantage : extrême rapidité

- Inconvénients :
  - n'a aucune connaissance des fichiers postérieurs à la mise à jour de la base.
  - continue de retourner les fichiers supprimés jusqu'à la prochaine mise à jour.


#### Utilisation

```bash
locate whatever_you_are_looking_for_^^

```

exemple:

```bash
stagiaire@debian:~$ locate *.sh
/boot/grub/i386-pc/modinfo.sh
/etc/console-setup/cached_setup_font.sh
/etc/console-setup/cached_setup_keyboard.sh
/etc/console-setup/cached_setup_terminal.sh
/etc/init.d/console-setup.sh
/etc/init.d/hwclock.sh
/etc/init.d/keyboard-setup.sh
/etc/profile.d/bash_completion.sh
/etc/rc0.d/K01hwclock.sh
/etc/rc2.d/S01console-setup.sh
/etc/rc3.d/S01console-setup.sh
/etc/rc4.d/S01console-setup.sh
/etc/rc5.d/S01console-setup.sh
/etc/rc6.d/K01hwclock.sh
/etc/rcS.d/S01hwclock.sh
/etc/rcS.d/S01keyboard-setup.sh
/etc/wpa_supplicant/action_wpa.sh
/etc/wpa_supplicant/functions.sh
/etc/wpa_supplicant/ifupdown.sh
/home/stagiaire/BOU/BOU.sh
/home/stagiaire/Scripts/3-date.sh
/home/stagiaire/Scripts/3-date_v2.sh
/home/stagiaire/Scripts/alias.sh
/home/stagiaire/Scripts/loop.sh
/usr/bin/gettext.sh
/usr/lib/console-setup/console-setup.sh
/usr/lib/console-setup/keyboard-setup.sh
/usr/lib/grub/i386-pc/modinfo.sh
/usr/lib/ifupdown/settle-dad.sh
/usr/lib/ifupdown/wait-for-ll6.sh
/usr/lib/ifupdown/wait-online.sh
/usr/lib/init/vars.sh
/usr/share/debconf/confmodule.sh
/usr/share/doc/cron/examples/cron-tasks-review.sh
/usr/share/doc/ifupdown/examples/check-mac-address.sh
/usr/share/doc/ifupdown/examples/get-mac-address.sh
/usr/share/doc/ifupdown/examples/pcmcia-compat.sh
/usr/share/doc/ifupdown/examples/ping-places.sh
/usr/share/doc/netcat-traditional/examples/scripts/dist.sh
/usr/share/os-prober/common.sh

```


## Commandes de gestion de contenu

Ces commandes peuvent travailler à partir d'un ou plusieurs fichiers ou à partir de l'entrée standard pour produire un résultat à partir des octets récupérés (fichier/entrée standard). À ce sujet on parle de filtres.

### Affichage de fichier

- `cat`: <https://man7.org/linux/man-pages/man1/cat.1.html>

<span class=info>  Option intéressante: on peut compter les lignes avec `cat -n` </span>

```bash
NAME
       cat - concatenate files and print on the standard output

SYNOPSIS 

       cat [OPTION]... [FILE]...

DESCRIPTION 

       Concatenate FILE(s) to standard output.

       With no FILE, or when FILE is -, read standard input.

       -A, --show-all
              equivalent to -vET

       -b, --number-nonblank
              number nonempty output lines, overrides -n

       -e     equivalent to -vE

       -E, --show-ends
              display $ at end of each line

       -n, --number
              number all output lines

       -s, --squeeze-blank
              suppress repeated empty output lines

       -t     equivalent to -vT

       -T, --show-tabs
              display TAB characters as ^I

       -u     (ignored)

       -v, --show-nonprinting
              use ^ and M- notation, except for LFD and TAB

       --help display this help and exit

       --version
              output version information and exit


```




- `less`: <https://man7.org/linux/man-pages/man1/less.1.html>

<div class=info> La commande `less` possède toutes les capacités de `more` avec des options en plus ! :D 

On peut oublier la commande `more` et la remplacée par `less`.

</div>

> ***less*** does more than ***more*** :D


- `head`: Affichage des **premières** lignes d'un flux (fichier/entrée standard), 10 par défaut.

- `tail`: Affichage des **dernières** lignes d'un flux (fichier/entrée standard), 10 par défaut.
  - `tail -5`: les 5 dernières lignes
  - `tail -n +5`: les dernières lignes à partir de la ligne n°5



### Comptage 

- `wc`: nombre de lignes (-l), de mots (-w) et d'octets (-c)


### Tri 

Pour trier le contenu de fichier(s) on utilise la commande `sort`

- Par défaut le tri se fait sur le premier champ. Le séparateur par défaut est "espace" ou "tab".
- L'option `-r` inverse l'ordre.

```bash
sort -t" " -k2,2 -k1,1r fichier.text

# Trie sur le 2ème champ, puis sur le premier en sens inverse

```

```bash
sort -k1,1n Nombres.txt 
```

Pour tenir compte des caractères spéciaux on utilisera `LANG=C` qui repose sur le code ASCII. Cependant dans ASCII les masjuscules arrivent avant les minuscules. On utilisera donc aussi l'option `-f, --ignore-case`

```bash
stagiaire@debian:~$ LANG=C sort -f bla.txt

5165dbhgdh
:!;;**
azerty
cdsqoijsd
csodvcownfvmsoigmlg
csqdovsdfomsdfp^^i
lm:!:svi
qsock364157389

```

<div class=warning> Ne pas utiliser de redirection directe dans le fichier à trier !!
```bash
sort listATrier > ListATrier
```
Le fichier sera écrasé par du vide !!!
 </div>

### Transformation

La commande `tr`: `tr liste1 liste2`


Exemples:
```bash
# Caesar cipher encoding
echo "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG" | tr '[A-Z]' '[X-ZA-W]'
# output: QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD

# Caesar cipher decoding
echo "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD" | tr '[X-ZA-W]' '[A-Z]'
# output: THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
 

echo "AaBbCcDd" | tr [:upper:] [:lower:] 
# output: 
aabbccdd

```


### Extraction

Pour extraire des données de fichiers on utilise les commandes `cut` et `grep`.

#### la commande `cut`

NAME         

       cut - remove sections from each line of files

SYNOPSIS 

       cut OPTION... [FILE]...

DESCRIPTION 

       Print selected parts of lines from each FILE to standard output.

       With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short
       options too.

       -b, --bytes=LIST
              select only these bytes

       -c, --characters=LIST
              select only these characters

       -d, --delimiter=DELIM
              use DELIM instead of TAB for field delimiter

       -f, --fields=LIST
              select only these fields;  also print any line that
              contains no delimiter character, unless the -s option is
              specified

       -n     (ignored)

       --complement
              complement the set of selected bytes, characters or fields

       -s, --only-delimited
              do not print lines not containing delimiters

       --output-delimiter=STRING
              use STRING as the output delimiter the default is to use
              the input delimiter

       -z, --zero-terminated
              line delimiter is NUL, not newline

       --help display this help and exit

       --version
              output version information and exit

       Use one, and only one of -b, -c or -f.  Each LIST is made up of
       one range, or many ranges separated by commas.  Selected input is
       written in the same order that it is read, and is written exactly
       once.  Each range is one of:

       N      N'th byte, character or field, counted from 1

       N-     from N'th byte, character or field, to end of line

       N-M    from N'th to M'th (included) byte, character or field

       -M     from first to M'th (included) byte, character or field
<https://man7.org/linux/man-pages/man1/cut.1.html>


#### La commande `grep`

- `--color`: pour afficher les couleurs de résultat.

- `-c`: pour retourner le nombre de ligne(s) contenant l'expression de recherchée.

- `-v`: inverser la recherche

- `-e`: recherche étendue, expression(s) régulière(s)

<p class=info> Ne pas utiliser `egrep` mais bien `grep -e` ou `grep -E` pour les expressions étendues </p>


Exemple:

![](2021-06-07-POEI-Linux\grep.png)


# Expressions Régulières

Les expressions régulières sont utilisées par plusieurs utilitaires et languages de programmation différents *(grep, egrep, vi, sed, awk, perl, php, python, powershell, ...)*

***Il est essentiel de les maîtriser***

Précautions d’écriture:

• Doit faire juste ce qui lui est demandé ;
• Ne doit pas en faire de trop ;
• Doit en faire suffisamment.

## Méta-caractères

- `.`: Caractère ***Joker*** il remplace n'importe quoi *(équivalent de * dans le Shell)*

- `[…]`: N’importe quel caractère présent dans la liste entre crochets ;
  - La liste n’est pas une chaîne
  - Possibilité d’indiquer une étendue par ex. [m-t] pour [mnopqrst]

- `[^…]` N’importe quel caractère non présent dans la liste ;


### Extensions PCRE
- `\w` tout caractère alphanumérique et le caractère _ (souligné) ;
- `\d` tout chiffre
- `\s` tout caractère d’espacement
- `\W` négation de `\w`
- `\D` négation de `\d`
- `\S` négation de `\s`


NB: tout méta-caractère ne vaut que pour une et une seule occurrence.


## Facteurs d'occurences

- Permettent de préciser le nombre d’occurrences d’un motif 
- s’appliquent toujours au caractère/motif immédiatement précédent.

##### Syntaxe de base

- `\{n1,n2\}` *(ERB – NB : les \ et les {} doivent être protégés du SHELL)*

- `{n1,n2}`   *(ERE/PCRE – NB : les {} doivent être protégées du SHELL)*

***De n1 à n2 occurrences du caractères/motif précédent.***


##### Variations
(présentées avec la syntaxe ERE mais existent en ERB)

- `{n1,}`   ⇒ Au moins n1 occurrences
- `{n1}`    ⇒ Exactement n1 occurrences (!!!)


##### Simplifications
(spécifiques aux ERE/PCRE)

- `*` ⇒ {0,}
- `?` ⇒ {0,1}
- `+` ⇒ {1,}

## Facteurs d’occurrences - Gloutonnement

**Gloutonnement** ⇒ Faire correspondre le maximum d’occurrences


Exemple:
```bash
bab
baaab
baaaaaab

```

Voici une expression gloutonne:

```bash
$ grep -E --color ‘ba+’ regex.txt
bab
baab
baaaaaab

```

**Limitations du gloutonement** *(spécifiques aux PCRE)*

Le caractère `?` suffixant un facteur d’occurrences en limite le gloutonnement.

```bash
$ grep -E --color ‘ba+’ regex.txtbabbaabbaaaaaab$ grep -P --color ‘ba+?’ regex.txt
bab
baab
baaaaaab
```


## Ancrage

Les motifs d’ancrage permettent de symboliser le début et la fin d’une ligne :
- `^`: symbolise un début de ligne (si placé en début d’expression)
- `$`: symbolise la fin d’une ligne (si placé en fin d’expression)

Exemples
```bash
^[A-Z]  # Chaîne débutant par une majuscule
^Bob$   # Chaîne ne contenant que ‘Bob’
^$      # Chaîne vide
[0-9]$  # Chaîne se terminant par un chiffre

```


Remarque: 

Il est vivement conseillé d’utiliser les motifs d’ancrage chaque fois que cela est une évidence, cela limitera les situations d’expressions trop larges !


## Caractères divers

- `\` : permet de déspécialiser un caractère spécial

- `|` : indique l'alternative (ERE)

- `()`: limitation de motif, mémorisation dans les références arrières

![](2021-06-07-POEI-Linux\grep_limitation.png)

- `\n`: référence arrière, 




### QUIZZ

#### FIND

<div class=question> Que font les deux commandes, y a-t-il une différence ? </div>

```bash
find / -type f | wc -l  # Nombre de fichiers trouvés par find

find / -type f -exec wc -l {} \; # nombre de lignes pour CHACUN des fichiers trouvés.

```

#### HEAD / TAIL
<div class=question> Comment afficher la 6ème ligne du fichier /etc/passwd ? </div>

```bash
stagiaire@debian:~$ head -6 /etc/passwd | tail -1
games:x:5:60:games:/usr/games:/usr/sbin/nologin


```


#### SORT & CUT

<div class=question> Quel est le nom du plus vieil objet du répertoire /usr/bin ? </div>

```bash
# LS par ordre de temps inversé:
ls -alh --sort=time /usr/bin/

tail -1 # On récupère la dernière ligne

tr -s " " # on squeeze pour retirer les espace inutiles

cut -d" " -f5,9 # on récupère le champ n°5&9


#### commande finale:
stagiaire@debian:~$ ls -alh --sort=time /usr/bin/ | tail -1 | tr -s " " | cut -d" " -f5,9
120K mawk


# Marche aussi avec l'option --size ^^
ls -sth /usr/bin | tail -1


```

<div class=answer> Le plus vieux fichier du répertoire /usr/bin est: `120K mawk` </div>


<div class=question> Quel est le nom de l'utilisateur (/etc/passwd) ayant l'uid (3e champ) le plus élevé ? </div>

```bash
cut -d":" -f3,1 /etc/passwd | sort -t: -k2n | tail -1 | cut -d: -f1

# output: nobody

```


#### Expressions régulières

![](2021-06-07-POEI-Linux\regex.pdf)

Constituer les trois expressions régulières suivantes :

##### Modéliser un nombre entier positif (sans indication de signe)

```bash
grep -E "^[0-9]+$" grep.exo

```


##### Modéliser un nombre entier relatif (positif/négatif)

```bash
grep -E "^[+-]?[0-9]+$" grep.exo

```


##### Modéliser un réel (partie décimale à votre convenance)

```bash
grep -E "^[+-]?[0-9]+(\.[0-9]+)?$" grep.exo

```

##### Modéliser un nombre de 0 à 255 ?

```bash
    grep --color -E "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$" grep.txt

```


##### Modéliser une adresse IPv4 (avec interdiction de copier sur internet)

 - Pour info, une adresse IPv4 est composée de 4 nombres de 0 à 255, séparés par des points.

> **Grep IP Adresses:** 
> Match from `0.0.0.0` to `999.999.999.999`
>
> Command: `$ grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" file.txt`
>
> **Match on ly IPv4 Adresses:**
>
>
>
> `$ grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" file.txt`
>
>
> <cite> --https://www.shellhacks.com/regex-find-ip-addresses-file-grep/ </cite>


<div class=info> Pour simplifier on peut mettre l'expression régulière dans une variable ;) </div>

```bash
IP_Check = 25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?




```



##### Dans /usr/bin, combien y a-t-il de fichiers dont le nom est composé de 3 à 5 caractères ?

```bash
ls -lA /usr/bin | tr -s " " | cut -d" " -f 9 | grep -E "^(\w){3,5}$" | wc -l

```
On utilise l'option `-A` pour exclure les dossiers `.` et `..` *(qui sont créés par défaut)*.

En utilisant `find`:
```bash
sp=/usr/bin ; find $sp -regextype egrep -regex "${sp%/}/.{3,5}" | wc -l

```




##### Dans le fichier /etc/profile, combien y a-t-il de ligne vides (deux solutions) ?





##### Représenter un numéro minéralogique

- nouvelle forme
- ancienne forme (si vous voulez)


---

# *Tips & Tricks*

## Actualisation BASH Profile/RC

En cas de changement, du profil dans ***bashrc*** on peut actualiser le Shell en faisant:

```bash
source .bashrc

# Marche aussi:
. .bashrc

```

## Alias

La commande `alias` liste l'ensemble des **alias disponibles**.

## Type
La commande `type` est très partique pour déterminer la nature d'un objet.

```bash
type cd
cd est une primitive du shell
type tree
tree est /usr/bin/tree


```


## Touch && ">"
Comparaison entre la commande ``touch`` et ``>``

```bash=
i=0;time while [ $i -lt 10000 ]; do touch $i; ((i=i+1)); done
rm 0* 1* 2* 3* 4* 5* 6* 7* 8* 9*
i=0;time while [ $i -lt 10000 ]; do > $i; ((i=i+1)); done
rm 0* 1* 2* 3* 4* 5* 6* 7* 8* 9*

```

Résultat:
```bash=

stagiaire@debian:~$ i=0;time while [ $i -lt 10000 ]; do touch $i; ((i=i+1)); done

real    0m6,193s
user    0m4,580s
sys     0m1,582s


stagiaire@debian:~$ i=0;time while [ $i -lt 10000 ]; do > $i; ((i=i+1)); done

real    0m0,242s
user    0m0,151s
sys     0m0,089s

```

``>`` est beaucoup plus rapide et donc beaucoup plus performant **0,242s** au lieu de **6,193s** pour **touch**

## Noclobber

`date > date.log` écrasera automatiquement le fichier *date.log* si il existe.

Pour éviter de supprimer des fichiers par erreur, on utilisera l'option **noclobber**.

- `set -o noclobber`: active l'option de protection
- `set +o noclobber`: désactive l'option de protection

Pour vérifier l'état: 
```bash
stagiaire@debian:~$ set -o
allexport       off
braceexpand     on
emacs           on
errexit         off
errtrace        off
functrace       off
hashall         on
histexpand      on
history         on
ignoreeof       off
interactive-comments    on
keyword         off
monitor         on
noclobber       off
noexec          off
noglob          off
nolog           off
notify          off
nounset         off
onecmd          off
physical        off
pipefail        off
posix           off
privileged      off
verbose         off
vi              off
xtrace          off

```


## /DEV/NULL

Dans le cas où l'on souhaite se débarasser d'une partie des sorties d'une commande, on peut utiliser `/dev/null`.

- Si on veut éliminer les erreurs:

```bash
stagiaire@debian:~$ find /etc/ -type f -name "*.cfg" 2>/dev/null
/etc/default/grub.d/init-select.cfg
/etc/perl/Net/libnet.cfg
/etc/dpkg/dpkg.cfg

```

- Si on veut garder les erreurs:

```bash
find /etc/ -type f -name "*.cfg" 1>/dev/null

```

## Générateur de mot de passe

```bash
cat /dev/urandom | tr -dc "a-z0-9A-Z-$*µ?._&#=)@ " | head -c 32; echo

```


# Format des fichiers texte selon les OS

- **Windows** : simulation parfaite des machines à écrire (Retour-chariot/nouvelle ligne : CR LF)
- **Unix/Linux** : simplification par la suppression du CR : seul le LF est nécessaire
- **Mac** : simplification par la suppression de LF : seul le CR est nécessaire


- Limites des principaux systèmes de fichiers de Linux
***ext4*** (Debian, Ubuntu, ...)

  - Taille du FS : 1Eo en théorie (16To en pratique)

  - Taille d'un fichier : 2 To

- ***xfs*** (Redhat, CentOS, ...)

  - Taille du FS : 9 Eo

  - Taille d'un fichier : 9 Eo (pile de DVD de 2000km de haut !)

- ***btrfs*** (Fedora, Suse, ...)
  - 


---

# Recueil de Commandes:

- date

- pwd: print working directory
    
- hostname: nom de la machine/système

- whoami: nom de l'utilisateur courant

- logname: identité de connexion - peut être différente de l'identité courante
- stat: Affiche les informations 

```bash
stagiaire@debian:~$ stat bla.txt
  Fichier : bla.txt
   Taille : 19          Blocs : 8          Blocs dE/S : 4096   fichier
Périphérique : 801h/2049d       Inœud : 1044512     Liens : 1
Accès : (0777/-rwxrwxrwx)  UID : ( 1000/stagiaire)   GID : ( 1000/stagiaire)
 Accès : 2021-06-08 10:34:16.255266611 +0200
Modif. : 2021-06-07 17:46:48.100588972 +0200
Changt : 2021-06-07 17:47:16.304551490 +0200
  Créé : -

```

***file***: 
: Affiche les informations de type de fichier 


```bash
stagiaire@debian:~$ file bla.txt
bla.txt: ASCII text
stagiaire@debian:~$ file Scripts/3-date.sh
Scripts/3-date.sh: UTF-8 Unicode text

```

***LSOF:***
: Liste tous les fichiers ouverts.


##### Lien Utile 
<https://www.man7.org/linux/man-pages/man1/man.1.html>




# Questions

- fg/bg

- nice



# Idéés de **Scripts Shell**

<div class=info> ``echo "Fin de $0"`` permet d'afficher "Fin de *nom_du_script*"

Cela peut être utile pour afficher ou récupérer le nom du script. </div>

## Liste 3 dates
 1. Lister les fichiers d'un répertoire avec leur 3 dates (modification, lecture, modification des attributs).

```bash=
 #!/bin/bash

clear

for f in *
do
 echo " "
 echo " "
 stat "$f"
 echo " "
 echo "----------------------------------------------------------------------"
done
```

Résultat:
```bash=

  Fichier : bla.txt
   Taille : 19          Blocs : 8          Blocs d'E/S : 4096   fichier
Périphérique : 801h/2049d       Inœud : 1044512     Liens : 1
Accès : (0777/-rwxrwxrwx)  UID : ( 1000/stagiaire)   GID : ( 1000/stagiaire)
 Accès : 2021-06-07 17:46:48.100588972 +0200
Modif. : 2021-06-07 17:46:48.100588972 +0200
Changt : 2021-06-07 17:47:16.304551490 +0200
  Créé : -

----------------------------------------------------------------------


  Fichier : Scripts
   Taille : 4096        Blocs : 8          Blocs d'E/S : 4096   répertoire
Périphérique : 801h/2049d       Inœud : 1044515     Liens : 2
Accès : (0755/drwxr-xr-x)  UID : ( 1000/stagiaire)   GID : ( 1000/stagiaire)
 Accès : 2021-06-08 09:43:37.400370418 +0200
Modif. : 2021-06-08 09:47:13.255528315 +0200
Changt : 2021-06-08 09:47:13.255528315 +0200
  Créé : -

----------------------------------------------------------------------

```

## Script de mise à jour serveur

crontab vérifie mises à jour disponibles