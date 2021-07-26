# Classe de management de fichiers
class bootstrap::manage_file {

  # ressource file pour deposer un fichier statique
  file { 'depose fichier statique':
    path   => '/tmp/static',
    source => 'puppet:///modules/bootstrap/test.txt',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  # ressource file pour déposer un template (fichier dynamique)
  file { 'depose d un fichier dynamique template':
    path    => '/etc/motd',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('bootstrap/motd.epp'),
  }
}
