require "logstash/devutils/rspec/spec_helper"
require "logstash/inputs/pcap"
require 'ostruct'

def load_fixture(name)
  IO.read("spec/fixtures/#{name}")
end
