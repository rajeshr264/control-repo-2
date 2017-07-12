# /etc/puppetlabs/code/environments/production/site/andyaws/manifests/provision.pp
# Sample code to provision AWS instances

class andyaws::provision (
  $aws_region = "us-west-2",
  $agent_num = "13",
  )
  {
  ec2_instance { "Andy R Testing Agent${agent_num}":
    ensure  =>  present,
    region  => $aws_region,
    availability_zone => 'us-west-2a',
    image_id  =>  'ami-b55a51cc',
    subnet  =>  'tse-us-west-2-avza',
    security_groups =>  [
    'tse-us-west-2-crossconnect',
    'tse-us-west-2-agents'
    ],
    instance_type =>  't2.small',
    key_name  =>  'andy.rajagopalan',
    tags  =>  {
        name  => 'andy.rajagopalan',
        department  => 'tse',
        project => 'internal-practice',
        created_by => 'Andy R',
  }
 }
}