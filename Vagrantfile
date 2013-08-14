# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  #config.vm.box = "gentoo64"
  #config.vm.box_url = "http://dl.gusteau.gs/vagrant/gentoo64.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"

  src_dir = './sandbox'
  doc_root = '/vagrant_data'
  #src_dir = '../candycane'
  #doc_root = '/vagrant_data/app/webroot'
  
  config.vm.synced_folder src_dir, "/vagrant_data", :create => true, :owner=> 'vagrant', :group=>'www-data', :extra => 'dmode=775,fmode=775'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.add_recipe "omusubi"
    chef.json = { doc_root: doc_root}
  end
end
