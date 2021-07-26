# Classe de management ssh
class manage_ssh {

notify { 'Affichage classe ssh':
  message => 'classe manage_ssh',
}

package { 'openssh-server':
  ensure => 'installed',
}
# Notion de dépendance : package before augeas
-> augeas { 'conf sshd':
    context => '/files/etc/ssh/sshd_config',
    changes => [ 'set PermitRootLogin no',
                 'set LogLevel INFO',
               ],
    #notify  => Service['sshd'],
    #require => Package['openssh-server'],
}
# notify => appeler la ressource service SI changement dans augeas (config)
~> service { 'sshd':
  ensure => 'running',
  enable => true,
}
}

# Declaration de la classe manage_ssh 
# include manage_ssh
