class role::monitor {
  include profile::base
  include profile::nagios_server
  include profile::dev_tools
}
