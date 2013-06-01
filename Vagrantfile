# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.synced_folder "./sandbox", "/vagrant_data"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.roles_path = "./roles"
    chef.data_bags_path = "./data_bags"
    chef.add_recipe "candycane_cookbook"
    #chef.add_role "web"
 
    # You may also specify custom JSON attributes:
    chef.json = { :mysql_password => "foo" }
  end
end
