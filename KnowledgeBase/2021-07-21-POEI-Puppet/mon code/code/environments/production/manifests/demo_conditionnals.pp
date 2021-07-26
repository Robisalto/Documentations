# class demo conditionnals, instructions de contrôle

class demo_condition {

  # Test sur des facts
  ## Si 'Debian' alors ...
  if $facts['os']['family'] == 'Debian' {
    notify{'Linux type Debian ':}
  }
  ## ou si 'RedHat', alors ...
  elsif $facts['os']['family'] == 'RedHat' {
    notify{'Linux type RedHat ^^':}
  }
  ## Sinon, ...
  else {
    notify{'Os non supporté !!!':}
  }


  # Test de présence de valeur
  $tab_users = ['odin', 'thor', 'freya']
  if 'odin' in $tab_users {
    notify {'Odin is here':}
  }



  # Selector:Affecter une valeur dans une variable en fonction d'un fact
  # Affecter une liste de packages pour les familles Debian et RedHat
$list_package = $facts['os']['family'] ? {
  'Debian' => ['apache2', 'ntp'],
  'RedHat' => ['httpd', 'chrony'],
}
notify{'afficher des packages':
  message => "Liste packages: ${list_package}",
}


} # End of Class
