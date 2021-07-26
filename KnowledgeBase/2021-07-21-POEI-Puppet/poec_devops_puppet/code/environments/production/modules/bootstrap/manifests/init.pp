# Classe MAIN du module bootsrap => première classe exécutée
class bootstrap {
  include bootstrap::manage_package
  include bootstrap::manage_tz
  include bootstrap::manage_user
  include bootstrap::manage_file
}
