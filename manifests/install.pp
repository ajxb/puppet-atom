class atom::install inherits atom {

  include apt
  apt::ppa { 'ppa:webupd8team/atom': }

  package { 'atom':
    ensure => $atom::package_ensure,
    name   => $atom::package_name,
  }

  Apt::Ppa['ppa:webupd8team/atom']
  ~> Class['apt::update']
  -> Package['atom']
}
