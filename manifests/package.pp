# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rngtools::package
class rngtools::package(
  ### START Package Configuration ###
  $package_ensure           = $rngtools::package_ensure,
  $package_source           = $rngtools::package_source,
  $package_flavor           = $rngtools::package_flavor,
  $manage_repo              = $rngtools::manage_repo,
  $repo_release             = $rngtools::repo_release,
  $passenger_package_ensure = $rngtools::passenger_package_ensure,
  $repo_source              = $rngtools::repo_source,
  ### END Package Configuration ###
)inherits rngtools {
  assert_private()
  package { $package_name:
    ensure => $package_ensure,
    flavor => $package_flavor,
    source => $package_source,
  }
}
