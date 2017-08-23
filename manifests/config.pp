class openresty::config inherits openresty::params {

  file {
  'fastcgi.conf':
    ensure => file,
    path => "${nginx_base_dir}/conf/fastcgi.conf",
    content => template("openresty/fastcgi.conf.erb"),
    require => Class['openresty::package'];
  'account.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/modules/account.lua",
    content => template("openresty/modules/account.lua.erb"),
    require => Class['openresty::package'];
  'authentication.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/modules/authentication.lua",
    content => template('openresty/modules/authentication.lua.erb'),
    require => Class['openresty::package'];
  'authorisation.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/modules/authorisation.lua",
    content => template('openresty/modules/authorisation.lua.erb'),
    require => Class['openresty::package'];
  'cookie.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/modules/cookie.lua",
    content => template('openresty/modules/cookie.lua.erb'),
    require => Class['openresty::package'];
  'session.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/modules/session.lua",
    content => template('openresty/modules/session.lua.erb'),
    require => Class['openresty::package'];
  'access.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/access.lua",
    content => template('openresty/access.lua.erb'),
    require => Class['openresty::package'];
  'handle_login.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/handle_login.lua",
    content => template('openresty/handle_login.lua.erb'),
    require => Class['openresty::package'];
  'logout.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/logout.lua",
    content => template('openresty/logout.lua.erb'),
    require => Class['openresty::package'];
  'analytics.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/analytics.lua",
    content => template('openresty/analytics.lua.erb'),
    require => Class['openresty::package'];
  'nginx.conf':
    ensure => file,
    path => "${nginx_base_dir}/conf/nginx.conf",
    content => template('openresty/nginx.conf.erb'),
    require => Class['openresty::package'];
  'nginx.conf':
    ensure => file,
    path => "${nginx_base_dir}/conf/nginx.conf",
    content => template('openresty/nginx.conf.erb'),
    require => Class['openresty::package'];
  'check_geotoken.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/check_geotoken.lua",
    content => template('openresty/check_geotoken.lua.erb'),
    require => Class['openresty::package'];
  'geoserver_token.lua':
    ensure => file,
    path => "${nginx_base_dir}/conf/modules/geoserver_token.lua",
    content => template('openresty/geoserver_token.lua.erb'),
    require => Class['openresty::package'];
  }


  file { '/usr/local/openresty/nginx/conf/nginx.conf':
    ensure => 'link',
    target => "${nginx_base_dir}/conf/nginx.conf",
    force => true,
    require => File['nginx.conf'];
  }

}
