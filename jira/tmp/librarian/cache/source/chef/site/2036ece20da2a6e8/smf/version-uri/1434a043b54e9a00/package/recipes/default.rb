#
# Cookbook Name:: smf
# Recipe:: default
#
# Copyright 2012, ModCloth, Inc.
#

## These libraries need to be installed when the cookbook
#  is loaded, otherwise they are not available when the
#  cookbook runs.

xslt = execute 'install libxslt' do
  command 'pkgin -y install libxslt-1.1.26nb1'
  not_if 'pkgin list | grep libxslt'
  action :nothing
end

xslt.run_action(:run)

ruby_block "setup nokogiri environment" do
  block do
    ENV['NOKOGIRI_USE_SYSTEM_LIBRARIES'] = 'true'
  end

  action :nothing
end.run_action(:run)

chef_gem 'nokogiri'
require 'nokogiri'
