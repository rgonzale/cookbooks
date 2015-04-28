include_recipe "apt"
include_recipe "yum-epel"

mysql_service 'default' do
  version '5.7'
  instance "default"
  bind_address '0.0.0.0'
  port '3306'  
  data_dir '/data'
  initial_root_password 'changeme'
  action [:create, :start]
end

template "/etc/my-default/conf.d/innodb.cnf.erb" do
	source "innodb.cnf.erb"
end

mysql_connection_info = {:host => "127.0.0.1",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database 'postgresftw' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root',
    :password => node['mysql']['initial_root_password']
  )
  action :create
end

mysql_database_user 'allpg' do
  connection mysql_connection_info
  password 'super_secret'
  database_name 'postgresftw'
  host '%'
  privileges [:select,:update,:insert]
  action :grant
end
