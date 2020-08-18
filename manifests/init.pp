# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rngtools
class rngtools(
  ### START Package Configuration ###
  $package_ensure                        = $rngtools::params::package_ensure,
  $package_name                          = $rngtools::params::package_name,
  $package_source                        = $rngtools::params::package_source,
  Boolean $manage_repo                   = $rngtools::params::manage_repo,
  Optional[String] $repo_release         = $rngtools::params::repo_release,
  Optional[Stdlib::HTTPUrl] $repo_source = $rngtools::params::repo_source,
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_ensure                        = $rngtools::params::service_ensure,
  $service_enable                        = $rngtools::params::service_enable,
  $service_restart                       = $rngtools::params::service_restart,
  $service_name                          = $rngtools::params::service_name,
  $service_manage                        = $rngtools::params::service_manage,
  ### END Service Configuration ###
)inherits rngtools::params {
  contain rngtools::package
  contain rngtools::config
  contain rngtools::service

  Class['rngtools::package'] -> Class['rngtools::config'] ~> Class['rngtools::service']
  Class['rngtools::package'] ~> Class['rngtools::service']
}
