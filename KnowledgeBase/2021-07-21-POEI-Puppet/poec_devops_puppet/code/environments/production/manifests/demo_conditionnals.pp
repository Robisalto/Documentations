# classe demo conditionnals, instructions de controle
class demo_condition {

# Test sur des facts
# Si debian => notice
if $facts['os']['family'] == 'Debian' {
  notify {'Linux type Debian':
  }
}
# Ou si Redhat => notice
elsif $facts['os']['family'] == 'RedHat' {
  notify{'Linux type RedHat':
  }
}
# sinon => alert('')
else {
  notify{ 'OS non supporté':
  }
}

# Test de présence valeur
$tab_users = ['robert', 'michel', 'luc']
if 'luc' in $tab_users {
  notify {'Luc est présent':
  }
}

# Selector : Affecter une valeur dans une variable en fonction d'un fact
# Affecter une liste de package pour les famille Debian et RedHat
$list_package = $facts['os']['family'] ? {
  'Debian' => ['apache2', 'ntp'],
  'RedHat' => ['httpd', 'chrony' ],
}
notify {'affichage des packages':
  message => "Liste des packages :${list_package}",
  }
}
