# atom::config
#
# Handles the configuration files
#
# @param disable_gpu Specifies whether the atom application should be configured so that it is invoked with the --disable-gpu flag
class atom::config (
  Boolean $disable_gpu = $atom::params::disable_gpu
) inherits atom::params {
  if $disable_gpu {
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
