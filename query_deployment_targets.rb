#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

CONSUL_LEADER = "192.168.50.101"

output = {}
s_json = JSON.parse(Net::HTTP.get_response(URI.parse("http://#{CONSUL_LEADER}:8500/v1/catalog/services")).body)
services = s_json.keys.reject{|k| k == 'consul'}
services.each do |srv|
  res = Net::HTTP.get_response(URI.parse("http://#{CONSUL_LEADER}:8500/v1/catalog/service/#{srv}")).body
  json = JSON.parse(res)
  a = []
  json.each {|j| a << j['Address'] }
  output = output.merge({srv => a})
end

puts JSON.generate(output)


