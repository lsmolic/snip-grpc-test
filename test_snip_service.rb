#!/usr/bin/env ruby

require 'grpc'
require 'snip_services_pb'
require 'bop_services_pb'

def test_single_snip
	stub = Snip::UrlSnipService::Stub.new('0.0.0.0:50052', :this_channel_is_insecure)
	req = Snip::SnipRequest.new(url: 'http://www.google.com')
	resp_obj = stub.snip_it(req)
	puts "Snipped URL: #{resp_obj.url}"
end

def test_single_bop
	stub = Bop::BopService::Stub.new('0.0.0.0:50053', :this_channel_is_insecure)
	req = Bop::BopRequest.new(url: 'http://www.google.com')
	resp_obj = stub.bop_it(req)
	puts "Bopped URL: #{resp_obj.url}"
end

test_single_snip
# test_single_bop