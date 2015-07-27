default['tez']['tez_env']['tez_conf_dir'] = "/etc/tez/#{node['tez']['conf_dir']}"

hdp_version =
  case node['hadoop']['distribution_version']
  when '2.2.0.0'
    '2.2.0.0-2041'
  when '2.2.1.0'
    '2.2.1.0-2340'
  when '2.2.4.2'
    '2.2.4.2-2'
  when '2.2.4.4'
    '2.2.4.4-16'
  when '2.2.6.0'
    '2.2.6.0-2800'
  else
    node['hadoop']['distribution_version']
  end

if node['hadoop']['distribution'] == 'hdp' && node['hadoop']['distribution_version'].to_f >= 2.2
  default['tez']['tez_env']['tez_jars'] = '/usr/hdp/current/tez-client/*:/usr/hdp/current/tez-client/lib/*'
  default['tez']['tez_site']['tez.lib.uris'] = "${fs.default.name}/hdp/apps/#{hdp_version}/tez/tez.tar.gz"
else
  default['tez']['tez_env']['tez_jars'] = '/usr/lib/tez/*:/usr/lib/tez/lib/*'
  default['tez']['tez_site']['tez.lib.uris'] = '${fs.default.name}/apps/tez/,${fs.default.name}/apps/tez/lib/'
end

if node['hadoop'].key?('hadoop_env') && node['hadoop']['hadoop_env'].key?('hadoop_classpath')
  default['hadoop']['hadoop_env']['hadoop_classpath'] = "#{node['tez']['tez_env']['tez_conf_dir']}:#{node['tez']['tez_env']['tez_jars']}:$HADOOP_CLASSPATH:#{default['hadoop']['hadoop_env']['hadoop_classpath']}"
else
  default['hadoop']['hadoop_env']['hadoop_classpath'] = "#{node['tez']['tez_env']['tez_conf_dir']}:#{node['tez']['tez_env']['tez_jars']}:$HADOOP_CLASSPATH"
end
