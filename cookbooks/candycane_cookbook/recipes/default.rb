execute "apt-get" do
  command "apt-get update"
end

%{nginx php5 php5-mysql php5-cli php5-fpm php-pear mysql-server}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

execute "phpunit-install" do
  command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
  not_if { ::File.exists?("/usr/bin/phpunit")}
end

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