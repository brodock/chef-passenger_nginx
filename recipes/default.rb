#
# Cookbook Name:: passenger_nginx
# Recipe:: default
#
# Copyright (C) 2013 Gabriel Mazetto
#
include_recipe 'apt'

default_action = node[:passenger_nginx][:auto_upgrade] ? :upgrade : :install

# this is a dependency to phusion's passenger repository
package 'apt-transport-https' do
    action :install
end

apt_repository 'passenger' do
    uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
    distribution node[:lsb][:codename]
    components ['main']
    keyserver 'keyserver.ubuntu.com'
    key '561F9B9CAC40B2F7'
    notifies :run, 'execute[apt-get update]', :immediately
end

package 'nginx-full' do
    action default_action
end

package 'passenger' do
    action default_action
end

gem_package 'passenger' do
    action default_action
end

template "/etc/nginx/conf.d/passenger.conf" do
    source "passenger.conf.erb"
    mode 0644
    owner "root"
    group "root"
    notifies :reload, 'service[nginx]'
end

service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action   :start
end
