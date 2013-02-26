# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack-ntlm/version"

Gem::Specification.new do |s|
  s.name        = "rack-ntlm-test-service"
  s.version     = Rack::Ntlm::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luca Simone", "John Cant"]
  s.email       = ["info@lucasimone.info"]
  s.homepage    = "https://github.com/johncant/rack-ntlm-test-service"
  s.summary     = %q{Rack module for testing NTLM Authentication in an HTTP client}
  s.description = %q{a Rack module for testing NTLM Authentication in an HTTP client}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rubyntlm"

  s.add_development_dependency "pry"

end
