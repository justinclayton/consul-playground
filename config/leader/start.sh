#!/bin/sh

/vagrant/consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -client 0.0.0.0 -bind 0.0.0.0 &