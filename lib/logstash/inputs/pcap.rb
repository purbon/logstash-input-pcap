# encoding: utf-8
require "logstash/inputs/base"
require "logstash/namespace"

# This plugin works into getting data from your networks into logstash by leveraing
# the libpcap capabilities in your OS.

class LogStash::Inputs::Pcap < LogStash::Inputs::Base

  config_name "pcap"

  # If undefined, Logstash will complain, even if codec is unused.
  default :codec, "plain"

  # The interface you want to get data from
  config :interface, :validate => :string, :required => true

  public
  def register
    require "pcap"
    @client = Jruby::Pcap.live(@interface)
  end # def register

  def run(queue)
    @client.each do |packet|
      payload = { :timestamp => packet.timestamp }
      payload.merge!(packet.to_hash)
      event = LogStash::Event.new(payload)
      decorate(event)
      queue << event
    end
  end # def run


end # class LogStash::Inputs::Neo4j
