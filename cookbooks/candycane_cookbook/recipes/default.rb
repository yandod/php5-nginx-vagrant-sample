execute "apt-get" do
  command "apt-get update"
end
package "nginx"
package "php5"
package "php5-mysql"
package "php5-cli"
package "php5-fpm"
package "mysql-server"

template "/etc/nginx/conf.d/php-fpm.conf" do
  mode 0644
  source "php-fpm.conf.erb"
end

service "mysqld" do
  action [:start]
end

service "php5-fpm" do
  action [:start, :restart]
end

service "nginx" do
  action [:start, :restart]
end