# classe de management de la timezone
class bootstrap::manage_tz ( String $timezone = 'Europe/Paris' ) {

  notify { 'Modification de la Timezone':
    message => 'class: manage_tz',
  }

  exec { 'Mise à jour timezone':
    path    => [ '/usr/bin', '/usr/sbin', '/bin'],
    command => "timedatectl set-timezone ${timezone}",
    onlyif  => "timedatectl | grep Time | grep -v ${timezone}"
  }

}
