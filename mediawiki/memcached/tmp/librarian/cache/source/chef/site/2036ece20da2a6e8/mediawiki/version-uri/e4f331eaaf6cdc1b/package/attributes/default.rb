#
# Cookbook Name:: mediawiki
# Attribute:: default
#
# Copyright (C) 2014 Patrick Moore
#
# All rights reserved - Do Not Redistribute
#

default['mediawiki']['enable_https'] = false
default['mediawiki']['version'] = '1.24.0'
default['mediawiki']['path'] = '/var/www/html/wiki'
default['mediawiki']['mysql_host'] = 'localhost'
default['mediawiki']['mysql_password'] = 'randompassword'
default['mediawiki']['mysql_dbname'] = 'wiki'
default['mediawiki']['mysql_dbuser'] = 'wiki_user'
default['mediawiki']['mysql_dbpass'] = 'wiki_pass'

# Attributes for LocalSettings.php
# default['mediawiki']['localsettings']['server_name'] = 'Wiki'
# default['mediawiki']['localsettings']['meta_namespace'] = 'Project'
# default['mediawiki']['localsettings']['wgEmergencyContact'] = 'admin@localhost'
# default['mediawiki']['localsettings']['wgPasswordSender'] = 'admin@localhost'
# default['mediawiki']['localsettings']['wgDBtype'] = 'mysql'
# default['mediawiki']['localsettings']['wgDBserver'] = 'localhost'
# default['mediawiki']['localsettings']['wgDBname'] = 'wiki'
# default['mediawiki']['localsettings']['wgDBuser'] = 'wiki_user'
# default['mediawiki']['localsettings']['wgDBpassword'] = 'wiki_pass'
# default['mediawiki']['localsettings']['wgDBprefix'] = ''
# default['mediawiki']['localsettings']['dbEngine'] = 'InnoDB'
# default['mediawiki']['localsettings']['dbCharset'] = 'utf8'
# default['mediawiki']['localsettings']['wgEnableUploads'] = false
# default['mediawiki']['localsettings']['wgLanguageCode'] = 'en'
# default['mediawiki']['localsettings']['wgUseInstantCommons'] = true
