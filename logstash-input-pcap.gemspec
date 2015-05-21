Gem::Specification.new do |s|

  s.name            = 'logstash-input-pcap'
  s.version         = '0.1.0'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Logstash libpcap input"
  s.description     = "This input gets data out of lipcap and send it to LS so you can monitor your network for example"
  s.authors         = ["Pere Urbon-Bayes"]
  s.email           = 'pere.urbon@gmail.com'
  s.homepage        = "http://purbon.com/"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  s.add_runtime_dependency 'logstash-core', '>= 1.4.0', '< 2.0.0'

  if RUBY_PLATFORM == 'java'
    s.platform = RUBY_PLATFORM
    s.add_runtime_dependency 'jruby-pcap', '~>  0.1.0'
  end

  s.add_development_dependency 'logstash-devutils'
  s.add_development_dependency 'logstash-codec-plain'

end
