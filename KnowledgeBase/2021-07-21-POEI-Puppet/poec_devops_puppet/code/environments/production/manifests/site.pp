
node default {
  include ::manage_user
  include ::manage_package
}

# node 'cli01.formation.lan' , 'cli02.formation.lan' {
#  include manage_user
#}
node 'cli03.formation.lan' {
  include ::manage_ssh
  include bootstrap
}

node 'cli04.formation.lan' {
  # Déclaration d'une classe avec paramétre :
  include bootstrap
}
