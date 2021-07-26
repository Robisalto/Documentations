# TP Vars + Facts + conditionnals


**Objectifs**

---

Dans ce travail pratique nous allons:

- écrire un nouveau manifest
- Définir une classe
- se familiariser avec les variables, les facts et les conditions (instruction de controle)
- Utiliser la ressource package pour installer une liste de packages

**Prérequis**

- Doc :

  - **Variables** : https://puppet.com/docs/puppet/7/lang_variables.html

  - **Facts** : https://puppet.com/docs/puppet/7/lang_facts_accessing.html

  - **conditions** : https://puppet.com/docs/puppet/7/lang_conditional.html

  - **relationships** : https://puppet.com/docs/puppet/7/lang_relationships.html

---

## Exercice 1: Créer le manifest manage_package.pp dans code/environments/production/manifests


1. Définir une classe

2. Déclarer une variable lst_package qui s'adapte en fonction de l'os

  - Debian: ntp, apache2
  - RedHat: chrony, httpd

3. Utiliser cette variable dans une ressource **package** pour faire installer le produit sur les agent

  - https://puppet.com/docs/puppet/7/types/package.html

4. Déclarer la classe dans le manifest principal site.pp

