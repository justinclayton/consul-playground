all: prep vagrant

prep: jq consul hipchat_room_message ansible

ansible: /usr/local/bin/ansible

/usr/local/bin/ansible:
	brew install ansible

jq:
	curl -LOks http://stedolan.github.io/jq/download/linux64/jq
	chmod +x jq

consul:
	curl -LOks https://dl.bintray.com/mitchellh/consul/0.4.0_linux_amd64.zip
	unzip 0.4.0_linux_amd64.zip
	chmod +x consul
	rm -f 0.4.0_linux_amd64.zip

hipchat_room_message:
	curl -LOks https://raw.githubusercontent.com/hipchat/hipchat-cli/master/hipchat_room_message
	chmod +x hipchat_room_message

vagrant: vagrant-leader vagrant-webs

vagrant-leader:
	vagrant up leader

vagrant-webs:
	vagrant up web1
	vagrant up web2

vagrant-deployer:
	vagrant up deployer

vagrant-watcher:
	vagrant up watcher

clean:
	vagrant destroy -f
