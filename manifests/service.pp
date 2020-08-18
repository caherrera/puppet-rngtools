# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rngtools::service
class rngtools::service(
  $service_restart = $rngtools::service_restart,
  $service_ensure  = $rngtools::service_ensure,
  $service_enable  = $rngtools::service_enable,
  $service_name    = $rngtools::service_name,
  $service_flags   = $rngtools::service_flags,
  $service_manage  = $rngtools::service_manage,
)inherits rngtools {
  assert_private()

  if $service_manage {
    case $facts['os']['name'] {
      'OpenBSD': {
        service { $service_name:
          ensure     => $service_ensure,
          enable     => $service_enable,
          flags      => $service_flags,
          hasstatus  => true,
          hasrestart => true,
        }
      }
      default: {
        service { $service_name:
          ensure     => $service_ensure,
          enable     => $service_enable,
          hasstatus  => true,
          hasrestart => true,
        }
      }
    }
  }

  # Allow overriding of 'restart' of Service resource; not used by default
  if $service_restart {
    Service[$service_name] {
      restart => $service_restart,
    }
  }
}
