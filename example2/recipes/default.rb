include_recipe "apt"

package "ntp" do
	action :install
end

file "/etc/ntp.conf" do
	action :delete
end

template "/etc/ntp.conf" do
	source "ntp.conf.erb"
	variables :ntp_servers => ["0.pool.ntp.org", "1.pool.ntp.org", "2.pool.ntp.org", "3.pool.ntp.org"]
end

service "ntp" do
	action [:start, :enable]
end

