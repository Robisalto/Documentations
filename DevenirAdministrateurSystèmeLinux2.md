---
title: II. Installation & Administration d'un serveur
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />




---

<p style="text-align: center"> [I. Linux: Les commandes du terminal - Version PDF](DevenirAdministrateurSystèmeLinux2.pdf) </p>

---

# 3. Premiers pas dans l'administration d'un serveur Linux
## 3.1 Rechercher avec ``find`` et ``grep``

exemple:

```bash
find /emplacement -name "nom_a_rechercher*" -exec

# Rechercher avec le début de ligne qui commence par "PATH"
grep '^PATH' *
```

## 3.2 Gestion des utilisateurs d'un serveur Linux

Les objectifs sont:
- Créer des utilisateurs
- Gérer les Groupes
- Gérer les droits d'accès

### 3.2.1 Création d'un utilisateur:

```bash
# Création de l'utilisateur "fred"
sudo adduser fred
```

Cette commande permet de créer:

  1. l'**utilisateur** "fred"
  2. le **Groupe** "fred"
  3. le **répertoire** *"/home/fred"*
  4. copie des fichiers depuis ``/etc/skel``: Dans ce dossier on place les fichiers à copier par défaut dans les répertoire des nouveaux utilisateurs.


### 3.2.2 Pour créer un utilisateur dans un groupe existant:

```bash
sudo adduser bob --ingroup nom_du_grp
# Cette syntaxe est propre à Ubunt/Debian et peut être différente sur d'autres systèmes
```

<p class="alert"> > 😱 Par défaut le dossier d'un utilisateur est lisible `readable` par tous les utilisateurs !!! Tous le monde peut aller voir les fichiers des autres utilisateurs.

Pour chiffrer un dossier voir **[ecryptfs](https://www.ecryptfs.org/)** 
</p>


Pour changer le mot de passe d'un utilisateur on utilise la commande ``pwd``.


## 3.3 Permissions sur les fichiers d'un serveur

Pour savoir à quel groupe appartient un utilisateur, on utilise:
```bash
id -nG nom_de_utilisateur
```

Donner les droits de lecture pour un utilisateur sur un fichier:
```bash
sudo chmod u+r fichier.ext
```

Autres exemples:
```bash
sudo chmod ug+xr documents/
# Sur l'ensemble des fichiers dans documents (recursif)
sudo chmod -R a+r documents/
```

## 3.4 Compresser/Décompresser des archives
```bash
man tar # Pour avoir toutes les informations de commande
```

Compression:
````bash
# "c" pour Compress
tar cvzf nom_du_dossier.tar.gz nom_du_dossier/*
````

Décompression:
````bash
# "x" pour Extract
tar xvzf archive.tar.gz
````

## 3.5 Gérer les disques et les processus
Espace disque système:
```bash
# Disk Free
df 
```

Espace disque utilisateur:
```bash
# Disk User
du
```

Gérer les processus:
```bash
# Vision en temps réel des processus:
top
# Vision des processus à un instant t:
ps -aux
```

## 3.6 Cron & Logs

- Pour éditer: ``crontab -e``
- Pour consulter: ``crontab -l``

Consulter les logs de dpkg:
```bash
# Affiche les 20 dernières lignes du fichier dpkg.log
tail -n 20 /var/log/dpkg.log
```

## 3.7 Conclusion de la formation "Installation & Administration d'un serveur Linux"

## 3.8 Quizz

### Question 1. Quelle est la syntaxe correcte pour l'outil find ?
- ``find /etc -name "cron*" -print``

### Question 2. Le fichier qui contient les mots de passe des utilisateurs s'appelle ``_____``.
- ``/etc/shadow``

### Question 3. Par défaut, tout le monde a le droit de lire les fichiers dans le répertoire personnel d'un utilisateur Linux. 
- ``VRAI``

### Question 4. Par défaut, tout le monde a le droit de lire les fichiers dans le répertoire personnel d'un utilisateur Linux. 
- ``usermod -G``

### Question 5. Quelle est l'option de la commande tar qui permet de compresser en gzip ?
- ``-z``

### Question 6. La commande ``_____`` affiche en temps réel l'activité du système.
- ``top``

### Question 7. Le fichier de définition des tâches planifiées s'appelle ``_____``.
- ``crontab``






---

<p style="text-align: center"> [II. Installation & Administration d'un serveur - Version PDF](DevenirAdministrateurSystèmeLinux2.pdf) </p>

---

