$proyect_path = '/vagrant'
$as_vagrant   = 'su - vagrant -c'

exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    onlyif => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
}

package { 'curl':
  ensure => installed,
  require  => Exec['apt-get update'],
}

package { 'build-essential':
  ensure => installed,
  require  => Exec['apt-get update'],
}

package { 'git-core':
  ensure => installed,
  require  => Exec['apt-get update'],
}

package { 'imagemagick':
  ensure => installed,
  require  => Exec['apt-get update'],
}

# package { 'libxml2':
#   ensure => installed,
#   require  => Exec['apt-get update'],
# }

# package { 'libxslt-dev':
#   ensure => installed,
#   require  => Exec['apt-get update'],
# }

# package { 'libxml2-dev':
#   ensure => installed,
#   require  => Exec['apt-get update'],
# }

class { 'ruby':
  gems_version  => 'latest'
}

package { 'bundler':
    ensure   => 'installed',
    provider => 'gem',
    require => Class['ruby']
}


exec {'bundle-install':
      command => '/usr/local/bin/bundle install',
      cwd     => '/vagrant',
      require => Package['bundler'],
    }
