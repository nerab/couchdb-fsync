# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'couch-rack/version'

Gem::Specification.new do |spec|
  spec.name          = "couch-rack"
  spec.version       = CouchRack::VERSION
  spec.authors       = ["Nicholas E. Rabenau"]
  spec.email         = ["nerab@gmx.at"]
  spec.summary       = %q{CouchDB utilities for Rack-based servers}
  spec.description   = %q{Utilities that simplify working with CouchDB from a Rack-based server, e.g. Sinatra.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'couchrest'
  spec.add_dependency 'dotenv'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rerun'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-minitest'
end
