class system::admins {
  require mysql::server
  $def_ensure = present
  $def_max    = 600

  $mysql_users = {
    'zack' => {
      max_queries_per_hour => 1200,
    },
    'monica' => {},
    'ralph' => {
     ensure => absent,
    },
    'brad' => {},
    'luke' => {},
  }

  $mysql_users.each |$username, $attributes| {
    mysql_user { "${username}@localhost":
      ensure               => pick($attributes['ensure'],$def_ensure),
      max_queries_per_hour => pick($attributes['max_queries_per_hour'], $def_max),
    }
    user { $username:
      ensure => present,
    }
  }
}
