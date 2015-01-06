# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty32"
  config.vm.boot_timeout = 0
  
  # Forward ports for modules. The maximum number of modules is 9
  for i in 8080..8089
    config.vm.network :forwarded_port, guest: i, host: i
  end

  # Forward port for admin
  config.vm.network :forwarded_port, guest: 8000, host: 8000

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Enable symlinks for Windoze
  config.vm.provider "virtualbox" do |v|
    #v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end

  # Provision Ubuntu box
  config.vm.provision "shell", path: "environment/provision/ubuntu.sh"

  # Provision Cloud SDK
  config.vm.provision "shell", path: "environment/provision/gcloud.sh"

end
