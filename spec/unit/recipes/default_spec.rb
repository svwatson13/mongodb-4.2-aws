#
# Cookbook:: mongodb_18
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongodb_18::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
     it 'source list' do
       allow(File).to receive(:exist?)
       .with('/etc/apt/sources.list.d/')
       .and_return(true)
     end
     it 'mongodb' do
       allow(File).to receive(:exist?)
       .with('/etc/apt/sources.list.d/mongodb-org-4.2.list')
       .and_return(true)
     end

     it 'apt' do
       expect(chef_run).to include_recipe 'apt'
     end
  
     it 'mongod.conf template' do
       expect(chef_run).to create_template('/etc/mongod.conf').with_variables(bindIp: node['mongodb']['config']['mongod']['net']['bindIp'],
       port: node['mongodb']['config']['mongod']['net']['port'])
     end
     it 'mongod.service template' do
       expect(chef_run).to create_template('/lib/systemd/system/mongod.service')
     end
     it 'enables mongod service' do
       expect(chef_run).to enable_service "mongod"
     end

     it 'starts mongod service' do
       expect(chef_run).to start_service "mongod"
     end
  end
  # context 'When all attributes are default, on CentOS 7' do
  #   # for a complete list of available platforms and versions see:
  #   # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
  #   platform 'centos', '7'
  #
  #   it 'converges successfully' do
  #     expect { chef_run }.to_not raise_error
  #   end
  # end
