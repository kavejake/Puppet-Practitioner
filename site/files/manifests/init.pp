class files {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  file { ['/etc/cron.allow','/etc/cron.deny']:
    ensure => file,
  }
  file_line { 'allow root cron jobs':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }

  file_line { 'deny all cron jobs':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
  }

  concat { '/etc/motd':
    ensure => present,
    owner  => 'root',
    group  => 'root',
  }

  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => epp('files/motd_header.epp'),
  }

  concat::fragment { 'motd warning':
    target  => '/etc/motd',
    order   => '02',
    content => 'Warning! You have accessed a restricted area!',
  }

}
