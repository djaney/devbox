# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 3306, host: 3306 #mysql
  config.vm.network :forwarded_port, guest: 11300, host: 11300 #beanstalkd
  config.vm.network :forwarded_port, guest: 27017, host: 27017 #mongodb
  config.vm.provision :shell, path: "bootstrap.sh"
end
