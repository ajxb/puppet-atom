class atom::config inherits atom {

  if $atom::disable_gpu {
    file { '/etc/profile.d/atom.sh':
      ensure => file,
      source => 'puppet:///modules/atom/atom.sh',
    }
  } else {
    file { '/etc/profile.d/atom.sh':
      ensure => absent,
      source => 'puppet:///modules/atom/atom.sh',
    }
  }

  file { '/usr/share/applications/atom.desktop':
    ensure  => file,
    content => epp('atom/atom.desktop.epp'),
  }
}
