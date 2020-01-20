# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'mongodb_18'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'mongodb_18::default'

# Specify a custom source for a single cookbook:
cookbook 'mongodb_18', path: '.'
cookbook 'apt', '~> 7.2.0'
# cookbook 'apt', '~> 7.2.0'
# cookbook 'poise-python', '~> 1.7.0'
# cookbook 'yum', '~> 5.1.0'
cookbook 'sc-mongodb', '~> 1.2.0', :supermarket
