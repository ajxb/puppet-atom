# Class: atom
#
# Manage installation and configuration of atom on Ubuntu, installing from ppa
#
# @example Declaring the class
#   include atom
# @example Declaring the class with parameters
#   class { 'atom':
#     disable_gpu => true,
#   }
#
# @param disable_gpu Specifies whether the atom application should be configured so that it is invoked with the --disable-gpu flag
# @param package_ensure Specifies whether to install the atom package, and what version to install
class atom (
  String  $package_ensure = $atom::params::package_ensure,
  Boolean $disable_gpu    = $atom::params::disable_gpu
) inherits atom::params {

  class { 'atom::install':
    package_ensure => $package_ensure,
  }

  class { 'atom::config':
    disable_gpu => $disable_gpu,
  }

  contain atom::install
  contain atom::config

  Class['::atom::install']
  -> Class['::atom::config']
}
