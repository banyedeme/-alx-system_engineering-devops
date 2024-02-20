# Ensure the /etc/default/nginx file exists
file { '/etc/default/nginx':
  ensure => present,
}

# Modify ULIMIT in /etc/default/nginx
exec { 'replace_ulimit':
  command => '/usr/bin/sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  require => File['/etc/default/nginx'],
  before  => Exec['restart_nginx'],
  path    => ['/bin', '/usr/bin'],  # Specify the path to sudo
}

# Restart nginx after modifying the file
exec { 'restart_nginx':
  command => '/usr/bin/sudo service nginx restart',
  path    => ['/bin', '/usr/bin'],  # Specify the path to sudo
  require => Exec['replace_ulimit'],
}
