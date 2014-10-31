all: prep vagrant

prep: jq consul ui hipchat_room_message ansible

ansible: /usr/local/bin/ansible

/usr/local/bin/ansible:
	brew install ansible

jq:
	curl -LOks http://stedolan.github.io/jq/download/linux64/jq
	chmod +x jq

consul:
	curl -LOks https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip
	unzip 0.4.1_linux_amd64.zip
	chmod +x consul
	rm -f 0.4.1_linux_amd64.zip

ui:
	curl -LOks https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip
	unzip 0.4.1_web_ui.zip
	mv dist ui
	rm -f 0.4.1_web_ui.zip

hipchat_room_message:
	curl -LOks https://raw.githubusercontent.com/hipchat/hipchat-cli/master/hipchat_room_message
	chmod +x hipchat_room_message

envconsul:
	curl -LOks https://github.com/hashicorp/envconsul/releases/download/v0.2.0/envconsul_linux_amd64
	mv envconsul_linux_amd64 envconsul
	chmod +x envconsul

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
