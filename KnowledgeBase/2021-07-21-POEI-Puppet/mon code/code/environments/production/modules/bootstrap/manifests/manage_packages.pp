class bootstrap::manage_packages {

  notify { 'Manage Packages':
    message => 'class: manage_packages',
  }
  
  # 1. Déclarer une variable lst_package qui s'adapte en fonction de l'os
  $lst_package = $facts['os']['family'] ? {
    'Debian' => ['apache2', 'ntp'],
    'RedHat' => ['httpd', 'chrony'],
  }
  
  # 2. Utiliser cette variable dans une ressource **package** pour faire installer le produit sur les agent
  package {$lst_package:
    ensure  =>  installed,
  }


} # End of Class
