#
# Cookbook Name:: mediawiki
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'mediawiki::mysql'
include_recipe 'apache2::default'
include_recipe 'apache2::mod_php5'

if node['mediawiki']['enable_https'] == true
  include_recipe 'apache2::mod_ssl'
end

include_recipe 'php::module_mysql'

package 'php-xml'

# Download source files
remote_file "#{Chef::Config[:file_cache_path]}/mediawiki-#{node['mediawiki']['version']}.tar.gz" do
  source "http://releases.wikimedia.org/mediawiki/1.24/mediawiki-#{node['mediawiki']['version']}.tar.gz"
  action :create
end

# Create directory for the wiki
directory node['mediawiki']['path'] do
  owner node['apache']['user']
  group node['apache']['group']
  mode '00755'
  action :create
end

# Untar the tarball into its location
execute 'extract_wiki' do
  command "tar xzf #{Chef::Config[:file_cache_path]}/mediawiki-#{node['mediawiki']['version']}.tar.gz --strip-components=1 -C #{node['mediawiki']['path']}"
  not_if { ::File.exist?("#{node['mediawiki']['path']}/index.php") }
end

# Include the apache configuration recipe
include_recipe 'mediawiki::apache'
