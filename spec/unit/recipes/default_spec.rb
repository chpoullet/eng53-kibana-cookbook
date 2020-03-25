#
# Cookbook:: kibana_cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'kibana_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 7' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'centos', '7'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should update source list' do
      expect(chef_run).to update_apt_update('updated_sources')
    end
    it 'apt-transport-https' do
      expect(chef_run).to install_package "apt-transport-https"
    end
    it 'should create a kibana.yml templates in /etc/kibana/kibana.yml' do
      expect(chef_run).to create_template "/etc/kibana/kibana.yml"
    end
    it 'should add elasticsearch key' do
      expect(chef_run).to execute 'wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
    end
    it 'should add elasticsearch repository' do
      expect(chef_run).to execute 'sudo add-apt-repository "deb https://artifacts.elastic.co/packages/7.x/apt stable main"'
    end
    it 'should fix template' do
      expect(chef_run).to execute 'sudo chmod go-w /etc/kibana/kibana.yml'
    end
  end
end
