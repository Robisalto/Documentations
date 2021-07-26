# Class MAIN (principale) du module bootstrap
class bootstrap {
  include bootstrap::manage_packages
  include bootstrap::manage_tz
  include bootstrap::manage_user
  include bootstrap::manage_files
}
