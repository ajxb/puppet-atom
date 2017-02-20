# atom::params
#
# Handles the module default parameters
#
class atom::params {

  case $facts['operatingsystem'] {
    'Ubuntu': {
      $package_ensure = 'latest'
      if $facts['is_virtual'] {
        $disable_gpu = true
      } else {
        $disable_gpu = false
      }
    }
    default: {
      fail("${facts['operatingsystem']} not supported")
    }
  }
}
