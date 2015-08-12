# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ra11y/version'

Gem::Specification.new do |spec|
  spec.name          = "ra11y"
  spec.version       = Ra11y::VERSION
  spec.authors       = ["Ben Balter"]
  spec.email         = ["ben.balter@github.com"]
  spec.summary       = "Ruby-based accessibility testing for Jekyll and other static sites"
  spec.homepage      = "https://github.com/benbalter/ra11y"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "colorator", "~> 0.1"
  spec.add_dependency "parallel", "~> 1.6"
  spec.add_dependency "cliver", "~> 0.3"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
