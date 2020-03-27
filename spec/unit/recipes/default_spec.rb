
require 'spec_helper'

describe 'kibana_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should update source list' do
      expect(chef_run).to update_apt_update('update_sources')
    end
    it 'apt-transport-https' do
      expect(chef_run).to install_package "apt-transport-https"
    end
    it 'should create a kibana.yml templates in /etc/kibana/kibana.yml' do
      expect(chef_run).to create_template "etc/kibana/kibana.yml"
    end
    it 'kibana' do
     expect(chef_run).to install_package "kibana"
    end
  end
end
