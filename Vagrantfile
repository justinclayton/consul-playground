# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
LEADER_IP="192.168.50.101"

nodes = {
  'leader'   => '192.168.50.101',
  'web1'     => '192.168.50.151',
  'web2'     => '192.168.50.152',
  'deployer' => '192.168.50.201',
  'watcher'  => '192.168.50.251',
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nodes.each do |name, ip|
    config.vm.define name do |v|
      v.vm.box = 'puppetlabs/centos-6.5-64-nocm'
      v.vm.hostname = name
      v.vm.network :private_network, ip: ip
      v.vm.provision :shell, inline: 'service iptables stop'
      v.vm.provision :shell, path: "config/#{name}/start.sh"
    end
  end
end