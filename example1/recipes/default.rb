include_recipe "apt"

package "ntp" do
	action :install
end

file "/etc/ntp.conf" do
	action :delete
end

file "/etc/ntp.conf" do
	content "server 0.pool.ntp.org
server 1.pool.ntp.org
server 2.pool.ntp.org"
end

service "ntp" do
	action [:start, :enable]
end
