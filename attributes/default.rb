override['mongodb']['package_version'] = '4.2.0'
#node.default['mongodb']['bindIp'] = '0.0.0.0'
override['mongodb']['config']['mongod']['net']['bindIp'] = '0.0.0.0'
override['mongodb']['config']['mongod']['net']['port'] = '27017'
#default['mongod']['ipaddress'] = '0.0.0.0'
#default['mongod']['port'] = 27017
