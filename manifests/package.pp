
class openresty::package inherits openresty::params {

  yumrepo { 'OpenRestyRepository':
    ensure   => 'present',
    baseurl  => 'https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/epel-$releasever-$basearch/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/pubkey.gpg'
  }

  package { 'openresty':
    ensure  => "${llc_openresty_version}",
    require => Yumrepo['OpenRestyRepository'];
  }

}
