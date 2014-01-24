# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greenbrick/version'

Gem::Specification.new do |spec|
  spec.name          = "greenbrick"
  spec.version       = Greenbrick::VERSION
  spec.authors       = ["Andrew Kokthmann"]
  spec.email         = ["akothmann@iexposure.com"]
  spec.summary       = %q{An application configuration store with pluggable storage support.}
  spec.description   = %q{An application configuration store with a pluggable storage engine. Supports YAML and Redis by default}
  spec.homepage      = ""
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.files         = Dir["{lib}/**/*"] + %w[LICENSE.txt Rakefile README.md]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'redis'
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
