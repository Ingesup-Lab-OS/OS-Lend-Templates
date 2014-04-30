include php
include php::fpm

include nginx

nginx::resource::vhost { 'default':
  ensure => present,
  listen_options => 'default_server',
  www_root => '/var/www/',
}

nginx::resource::location { 'php_fpm':
  ensure => present,
  vhost => 'default',
  www_root => '/var/www/',
  location => '~ \.php$',
  index_files => ['index.php', 'index.html', 'index.htm'],
  fastcgi => '127.0.0.1:9000',
}

include mysql::server
