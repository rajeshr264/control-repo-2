## Description

#Instructions to provision an EC2 instance using the AWS module

puppet apply -e "class whatever { variable = blah, variable1 = blah, }"	

*linprov.pp - provisions an instance running linux and installs the puppet agent after installation

puppet apply -e "class{'araws::linprov' : inst_nm => 'AR-Demowebserver02',inst_type => 't2.small',pe_role => 'webserver'}"