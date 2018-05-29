# /etc/puppetlabs/code/environments/production/site/profile/manifests/demohttpd.pp
# Sample code calling the arapache class,making some small changes

class profile::demohttpd

{
  #include cis
  #include cis_rhel7
  include ::cis_benchmarks
  include arapache

  firewall { '1 allow http access':
  dport  => 80,
  proto  => tcp,
  action => accept,
}

Class['cis_benchmarks'] -> Class['arapache'] -> Firewall['1 allow http access']

}
