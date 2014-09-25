all: prep vagrant

prep: jq consul hipchat_room_message ansible

ansible: /usr/local/bin/ansible

/usr/local/bin/ansible:
	brew install ansible

jq:
	curl -LOks http://stedolan.github.io/jq/download/linux64/jq

consul:
	curl -LOks https://dl.bintray.com/mitchellh/consul/0.4.0_linux_amd64.zip
	unzip 0.4.0_linux_amd64.zip
	rm -f 0.4.0_linux_amd64.zip

hipchat_room_message:
	curl -LOks https://raw.githubusercontent.com/hipchat/hipchat-cli/master/hipchat_room_message

vagrant: vagrant-leader vagrant-webs

vagrant-leader:
	vagrant up server101

vagrant-webs:
	vagrant up server102
	vagrant up server103

clean:
	vagrant destroy -f