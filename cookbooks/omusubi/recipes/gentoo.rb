# to use this recipe, please specify cnadycane_cookbook::gentoo


execute "emerge --sync" do
  command "emerge --sync"
  only_if {node['platform'] == 'gentoo'}
end

packages = %w{git subversion nginx dev-lang/php PEAR-PEAR dev-db/mysql-init-script}
execute "manual-mysql" do
  command "emerge dev-db/mysql"
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

execute "phpunit-install" do
  command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
  not_if { ::File.exists?("/usr/bin/phpunit")}
end

execute "composer-install" do
  command "curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/local/bin/composer"
  not_if { ::File.exists?("/usr/local/bin/composer")}
end

directory "/etc/nginx/conf.d/" do
  action :create
end
template "/etc/nginx/conf.d/php-fpm.conf" do
  mode 0644
  source "php-fpm.conf.erb"
end

%w{mysql php5-fpm nginx}.each do |service_name|
    service service_name do
      action [:start, :restart]
    end
end
