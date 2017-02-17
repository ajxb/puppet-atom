class atom::params {

  case $facts['operatingsystem'] {
    'Ubuntu': {
      $package_ensure = 'latest'
      $disable_gpu    = false
    }
    default: {
      fail("${facts['operatingsystem']} not supported")
    }
  }
}
