#
# Cookbook Name:: passenger_nginx
# Recipe:: default
#
# Copyright (C) 2013 Gabriel Mazetto
#
include_recipe 'apt'

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
    action :upgrade if node[:passenger_nginx][:auto_upgrade]
end

package 'passenger' do
    action :upgrade if node[:passenger_nginx][:auto_upgrade]
end