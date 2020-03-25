#
# Cookbook:: kibana_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'apt'
apt_update 'update_sources' do
  action :update
end

apt_update "update" do
  action :update
end

package "apt-transport-https"
package "openjdk-8-jdk"


execute "add key" do
  command 'wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
end

execute "add repository" do
  command 'sudo add-apt-repository "deb https://artifacts.elastic.co/packages/7.x/apt stable main"'
end

apt_update "update" do
  action :update
end

package "kibana"

template 'etc/kibana/kibana.yml' do
  source 'kibana.yml.erb'
  mode '666'
  owner 'root'
  group 'root'
end

execute 'fix_template' do
  command 'sudo chmod go-w /etc/kibana/kibana.yml'
end

service 'kibana' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
