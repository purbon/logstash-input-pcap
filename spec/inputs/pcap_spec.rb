require_relative "../spec_helper"
require "logstash/plugin"
require "logstash/json"

describe LogStash::Inputs::Pcap do

  let(:plugin) { LogStash::Plugin.lookup("input", "pcap").new( { "interface" => "en0" } ) }

  it "register without errors" do
    expect { plugin.register }.to_not raise_error
  end

  it "teardown without errors" do
    expect { plugin.teardown }.to_not raise_error
  end

end
