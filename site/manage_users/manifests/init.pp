# /etc/puppetlabs/code/environments/production/site/manage_users/manifests/init.pp

class manage_users {
  user {"cmsuser":
  ensure  =>  present,
  groups  =>  wheel,
  password  =>  '$1$D6CTx5Rl$F5LoY3.IXfTQX2cr27gIT1',
  }
  user {"wordpress":
  ensure  => present,
  groups => wordpress,
  password => '$1$tPyS005D$BO2bEaAK/ufrBYJqcuzel0'
 }
 group {"wordpress":
  ensure => present,
 }
}