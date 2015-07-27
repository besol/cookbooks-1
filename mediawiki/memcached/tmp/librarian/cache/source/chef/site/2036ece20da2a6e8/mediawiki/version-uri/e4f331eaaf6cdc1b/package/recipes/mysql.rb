#
# Cookbook Name:: mediawiki
# Recipe:: mysql
#
# Copyright (C) 2014 Patrick Moore
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'database::mysql'
# include_recipe 'mysql::client'
# package 'libmysqlclient-dev'
# chef_gem 'mysql'

mysql_service 'default' do
  allow_remote_root false
  remove_anonymous_users true
  remove_test_database true
  server_root_password node['mediawiki']['mysql_password']
  action :create
end

mysql_db_info = {
  host: node['mediawiki']['mysql_host'],
  username: 'root',
  password: node['mediawiki']['mysql_password']
}

mysql_database node['mediawiki']['mysql_dbname'] do
  connection mysql_db_info
  action :create
end

mysql_database_user node['mediawiki']['mysql_dbuser'] do
  connection mysql_db_info
  password node['mediawiki']['mysql_dbpass']
  action :create
end

mysql_database_user node['mediawiki']['mysql_dbuser'] do
  connection mysql_db_info
  database_name node['mediawiki']['mysql_dbname']
  host node['mediawiki']['mysql_host']
  privileges [:all]
  action :grant
end
