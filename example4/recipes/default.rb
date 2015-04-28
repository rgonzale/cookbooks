include_recipe "apt"
include_recipe "yum-epel"

mysql_service 'default' do
  version '5.7'
  instance "default"
  bind_address '0.0.0.0'
  port '3306'  
  data_dir '/data'
  initial_root_password 'Welcome1'
  action [:create, :start]
end

template "/etc/my-default/conf.d/innodb.cnf.erb" do
	source "innodb.cnf.erb"
end
