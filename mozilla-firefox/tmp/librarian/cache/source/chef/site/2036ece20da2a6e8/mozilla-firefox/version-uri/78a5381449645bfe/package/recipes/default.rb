#
# Cookbook Name:: mozilla-firefox
# Recipe:: default
#

version = node['mozilla-firefox']['version']
lang = node['mozilla-firefox']['language'] 

if node['mozilla-firefox']['64'] == true
  os = 'linux64'
else
  os = 'linux'
end

url = "https://download.mozilla.org/?product=firefox-#{version}-SSL&os=#{os}&lang=#{lang}"

ark 'firefox' do
  action :install
  url url
  version version
  extension "tar.bz2"
  has_binaries ['firefox']
end

node['mozilla-firefox']['dependencies'].each do |dep|
  package dep do
    action :install
  end
end
