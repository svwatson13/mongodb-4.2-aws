# InSpec test for recipe mongodb_18::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
# describe port('0.0.0.0', 27017) do
#   it { should be_listening }
# end
describe port( 27017 ) do
  it { should be_listening }
end
describe port('0.0.0.0', 22)  do
  it { should be_listening}
end
# describe port(27017) do
#   it {should be_listening.on('0.0.0.0')}
# end
  # describe host('mongod') do
  #   its(:ipaddress) {should eq '0.0.0.0'}
  # end
describe service 'mongod' do
  it {should be_running}
  it {should be_installed}
end
describe package('mongodb-org') do
  its('version') {should eq '4.2.0'}
end
