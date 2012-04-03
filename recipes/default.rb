#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2012, Voxeo Labs ©2011
#
# All rights reserved - Do Not Redistribute
#

# gem_package "artii" do
#   options(:rdoc => false, :ri => false)
# end
# 
# script "write motd" do
#   interpreter "bash"
#   cwd "/tmp"
#   code <<-EOH
#     artii '#{node[:motd][:logo_text]}' --font #{node[:motd][:font]} >> "logo.txt"
#   EOH
# end

template "/etc/motd" do
  source "motd.erb"
  mode 0644
  variables({
    :hostname   => node.fqdn,
    :ipaddress  => node.ipaddress,
    :roles      => node.roles.join(", ")
  })
end
