# /etc/puppetlabs/code/environments/production/site/windemo/manifests/uc3.pp
# Sample Puppet code to automate joining a domain using DSC

class windemo::uc3 (
  $dscdnsipadress,
  $domainnm,
  $domainusernm,
  $domainpasswd,
  $ounm,
)

{
  reboot { 'dsc_reboot':
    message => 'DSC has requested a reboot',
    when    => pending,
  }

  dsc_xdnsserveraddress { 'add domain':
    ensure             => present,
    dsc_addressfamily  => 'IPv4',
    dsc_address        => $dscdnsipadress,
    dsc_interfacealias => 'Ethernet',
  }

  dsc_xcomputer { 'JoinDomain':
    dsc_name       => $::hostname,
    dsc_domainname =>  $domainnm,
    dsc_credential => {
      user     =>  $domainusernm,
      password =>  $domainpasswd },
    dsc_joinou     => $ounm,
    require        =>  Dsc_xdnsserveraddress['add domain'],
  }
}
