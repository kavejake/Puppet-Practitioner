class review (
  String $user = 'review',
) {

  include review::motd

  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc'
  }

  service { 'puppet':
    ensure => 'stopped',
    enable => 'false',
  }

}

