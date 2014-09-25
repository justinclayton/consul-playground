# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "puppetlabs/centos-6.5-64-nocm"
  [101,102,103].each do |i|
    config.vm.define "server#{i}" do |v|
      v.vm.hostname = "server#{i}"
      v.vm.network "private_network", ip: "192.168.50.#{i}"
      v.vm.provision :shell, :inline => "service iptables stop"
    end
  end
end
