# Class puppet user mgmt
class bootstrap::manage_user {

  notify { 'Affichage de la classe user':
    message => 'class: manage_user',
  }

  # Déclaration d'un Array List d'utilisateurs
  $list_user = ['test', 'dev', 'formation']
  # Utilisation de la fonction each
  $list_user.each | String $user| {
    user { $user:
    ensure      => 'present',
    comment     => 'managed by Puppet Server',
    home        => "/home/${user}",
    managehome  =>  'true',
    shell       => '/bin/bash',
    groups      => 'formation',
  }
  
  }

  group { 'formation':
    ensure   => 'present',
    provider => 'groupadd',
  }

}
