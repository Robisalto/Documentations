# Classe puppet de management des utilisateur
# Definition d'une classe
class bootstrap::manage_user {

notify { 'Affichage classe user':
  message => 'classe manage_user',
}

# Déclaration d'un Array (liste d'utilisateurs)
$list_user = ['test', 'dev', 'formation']

# Utilisation de la fonction each
$list_user.each |String $user|{
  user { $user:
    ensure     => 'present',
    comment    => 'user cree par puppetserver',
    shell      => '/bin/bash',
    managehome => 'true',
    groups     => 'formation',
    home       => "/home/${user}",
  }
}

group { 'formation':
  ensure => 'present',
}

}

# Declaration d'une classe : ajout à la compilation et donc catalogue
#include manage_user
