#!/bin/bash

leaderip=192.168.50.101

/vagrant/consul agent \
  -server \
  -bootstrap-expect 1 \
  -data-dir /tmp/consul \
  -ui-dir /vagrant/ui \
  -advertise ${leaderip} \
  -client 0.0.0.0 \
  -bind 0.0.0.0 &