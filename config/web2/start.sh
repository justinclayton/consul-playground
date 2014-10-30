#!/bin/bash

leaderip=192.168.50.101
myip=192.168.50.152


/vagrant/consul agent \
  -data-dir /tmp/consul \
  -bind ${myip} \
  -join ${leaderip} \
  -config-file /vagrant/web.json &