# classe de demo d'utilisation de variables
class demo_vars {

# Variable de type string (chaine caracteres)
$mavarstring = 'exemple_var_string'

# Variable déclarée mais vide
$mavarfuture = undef

# Variable type numérique (int)
$int_var = 2021

# Utilisation de variable via la ressource notify pour afficher les contenu des variables créées précedemment
notify { 'test variables':
  message => "Bonjour ma variable de type string est : ${mavarstring} et ma variable int est : ${int_var}",
}

# Cette classe ne s'appelle pas toute seule => il faut la déclarer (include) quelque part et pour quelqu'un....
# On faint un include demo_vars dans le fichier manifests/site.pp

# Creation d'un tableau
$tableau = ['puppet', '7.9.0']

# Avec une resource notify : afficher l'application et sa version dans un message
notify { 'analyse tableau':
  message => "Application: ${tableau[0]}, Version: ${tableau[1]}",
}

# Creation d'un hash (dictionnaire)
$hash = [
  {
    'name' => 'user1',
    'home' => '/prd/user1'
  },
  {
    'name' => 'user2',
    'home' => '/dev/user2'
  }
]

# Afficher un élément de ce dictionnaire
notify { 'analyse hash':
  message => "${hash[0]['home']}"
}


# Afficher l'os family et la distribution
notify { 'utilisation de facts':
  message => "Famille : ${facts['os']['family']}, Distri : ${facts['os']['distro']['codename']}"
}

}
