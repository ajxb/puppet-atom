# atom::install
#
# Handles the ppa setup and the atom package
#
# @param package_ensure Specifies whether to install the atom package, and what version to install
class atom::install (
  String $package_ensure = $atom::params::package_ensure,
) inherits atom::params {
  include apt
  apt::ppa { 'ppa:webupd8team/atom': }

  package { 'atom':
    ensure => $package_ensure,
  }

  Apt::Ppa['ppa:webupd8team/atom']
  ~> Class['apt::update']
  -> Package['atom']
}
