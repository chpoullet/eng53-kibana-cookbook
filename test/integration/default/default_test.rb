# InSpec test for recipe kibana_cookbook::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe package('kibana') do
  it { should be_installed }
end

describe package('openjdk-8-jdk') do
  it { should be_installed }
end

describe service "kibana" do
  it { should be_running }
  it { should be_enabled }
end

describe package('apt-transport-https') do
  it { should be_installed }
end
