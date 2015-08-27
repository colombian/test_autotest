package { 'curl':
  ensure => installed
}

package { 'build-essential':
  ensure => installed
}

package { 'git-core':
  ensure => installed
}

package { 'imagemagick':
  ensure => installed
}

package { 'libxml2':
  ensure => installed
}

package { 'libxslt-dev':
  ensure => installed
}

package { 'libxml2-dev':
  ensure => installed
}

exec { 'install_rvm':
  command => "${as_vagrant} 'curl -L https://get.rvm.io | bash -s stable'",
  require => Package['curl']
}

exec { 'install_ruby':
  command => "${as_vagrant} '${source_rvm} rvm install 2.1.1'",
  require => Exec['install_rvm']
}

exec { 'install_bundler':
  command => "${as_vagrant} '${source_rvm} gem install bundler --no-rdoc --no-ri'",
  require => Exec['install_ruby']
}

exec { 'bundle_install':
  command => "${as_vagrant} 'cd ${proyect_path} && ${source_rvm} bundle install'",
  require => Exec['install_rails'],
}
