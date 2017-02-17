class atom::params {

  case $::operatingsystem {
    'Ubuntu': {
      $package_ensure = 'latest'
      $package_name   = 'atom'
      $disable_gpu    = false
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
