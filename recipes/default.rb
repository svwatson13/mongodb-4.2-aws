#
# Cookbook:: mongodb_18
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
include_recipe 'sc-mongodb'
include_recipe 'apt'



template '/etc/mongod.conf' do
   source 'mongod.conf.erb'
   variables bindIp: node['mongodb']['config']['mongod']['net']['bindIp'],
   port: node['mongodb']['config']['mongod']['net']['port']
   notifies :restart, 'service[mongod]'
end
  #resource link
template "/lib/systemd/system/mongod.service" do
  source "mongod.service.erb"
  notifies :restart, 'service[mongod]'
end

service 'mongod' do
  action [ :enable, :start ]
end
