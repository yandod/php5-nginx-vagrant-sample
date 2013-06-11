execute "apt-get" do
  command "apt-get update"
end

%w{nginx php5 php5-mysql php5-cli php5-fpm php-pear mysql-server}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

execute "phpunit-install" do
  command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
  not_if { ::File.exists?("/usr/bin/phpunit")}
end

log node[:doc_root]
template "/etc/nginx/conf.d/php-fpm.conf" do
  mode 0644
  source "php-fpm.conf.erb"
end

%w{mysql php5-fpm nginx}.each do |service_name|
    service service_name do
      action [:start, :restart]
    end
end
