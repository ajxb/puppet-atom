class atom::params {

  case $facts['operatingsystem'] {
    'Ubuntu': {
      $package_ensure = 'latest'
      $package_name   = 'atom'
      $disable_gpu    = false
    }
    default: {
      fail("${facts['operatingsystem']} not supported")
    }
  }
}
