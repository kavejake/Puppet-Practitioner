class system::classroom {
  # export a virtual host resource for yourself
  host { 'ip6-allnodes':
    ensure => 'present',
    ip     => 'ff02::1',
    target => '/etc/hosts',
  }
  host { 'ip6-allrouters':
    ensure => 'present',
    ip     => 'ff02::2',
    target => '/etc/hosts',
  }
  host { 'ip6-localnet':
    ensure => 'present',
    ip     => 'fe00::0',
    target => '/etc/hosts',
  }
  host { 'ip6-mcastprefix':
    ensure => 'present',
    ip     => 'ff00::0',
    target => '/etc/hosts',
  }
  @@host { $facts['fqdn']:
    ensure       => 'present',
    host_aliases => [$facts['hostname']],
    ip           => $facts['ipaddress'],
    target       => '/etc/hosts',
    tag          => 'classroom',
  }
  host { 'localhost':
    ensure => 'present',
    ip     => '127.0.0.1',
    target => '/etc/hosts',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
    target       => '/etc/hosts',
  }

  Host <<| tag == 'classroom' |>>

  resources { 'host':
    purge => true,
  }

  # collect all resources from the database (including your own)
  # enforce only those tagged with `classroom`.

}
