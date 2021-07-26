# Classe de management du service SSH
class bootstrap::manage_ssh {

  notify { 'Affichage de la classe ssh':
    message => 'class manage_ssh',
  }

  package { 'openssh-server':
  ensure => 'installed',
}
-> augeas { 'conf sshd':
    context => '/files/etc/ssh/sshd_config',
    changes => [ 'set PermitRootLogin no',
                 'set LogLevel DEBUG',
               ],
    #notify  => Service['sshd'],
    #require => Package['openssh-server'],
}
~> service { 'sshd':
  ensure => 'running',
  enable => true,
}
}


# Déclaration d'une classe: 
# include manage_ssh
