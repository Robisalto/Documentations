# 

class bootstrap::manage_files {

  notify { 'Affichage de la classe Files':
    message => 'class: manage_files',
  }
  # # Copie de fichier statique
  # file { 'Copie de fichier statique':
  #   path    => '/tmp/static-copy.txt',
  #   source  => 'puppet:///modules/bootstrap/static.txt',
  #   owner   =>  'root',
  #   group   =>  'root',
  #   mode    =>  '644',
  # }

  # Copie de fichier dynamique Template
  file { 'Copie de Template':
    path    => '/etc/motd',
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '644',
    content =>  epp('bootstrap/motd.epp'),
   }
}


