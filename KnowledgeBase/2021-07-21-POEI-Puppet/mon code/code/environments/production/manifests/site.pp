# Manifest applied to 'cli03.formation.lan'
node 'cli03.formation.lan' {
  # include ::manage_ssh
  include bootstrap
}

node cli04.formation.lan {
  include bootstrap
}

# Manifest applied by default for nodes not-declared above
node default {
  include ::manage_user
  include ::manage_packages
}
