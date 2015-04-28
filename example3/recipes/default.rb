include_recipe "apt"

package "nginx" do
	action :install
end

package "git" do
	action :install
end

directory "/var/www" do
	action :create
end

git "/var/www/magic" do
	repository "https://github.com/jarosser06/magic"
	revision "master"
	action :checkout
end

template "/etc/nginx/sites-available/magic.conf" do
	source "magic.conf.erb"
	notifies :restart, "service[nginx]", :immediately
end

link "/etc/nginx/sites-enabled/default" do
	action :delete
end

link "/etc/nginx/sites-enabled/default" do
	to "/etc/nginx/sites-available/magic.conf"
end

service "nginx" do
	action [:enable, :restart]
end
