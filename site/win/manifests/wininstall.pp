# /etc/puppetlabs/code/environments/production/site/win/manifests/winusers.pp
class win::wininstall.pp {
  package {'notepadplusplus':
  ensure  =>  latest,
  provider  =>  'chocolatey'
  }
}