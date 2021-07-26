# Classe de management package
class bootstrap::manage_package {
  
  notify { 'Affichage classe manage_package':
    message => 'classe manage_package',
  }
  # Déclaration d'un variable et injection de valeur grace a un selector
  $list_package = $facts['os']['family'] ? {
  'Debian' => ['apache2', 'ntp'],
  'RedHat' => ['httpd', 'chrony'],
  }

  # déclaration de la ressource package
  # utilisation de la variable dans le resource title
  # pour déclarer deux ressources
  package { $list_package:
    ensure => 'installed',
  }

}
