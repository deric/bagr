# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bagr/version'

Gem::Specification.new do |spec|
  spec.name          = "bagr"
  spec.version       = Bagr::VERSION
  spec.authors       = ["Tomas Barton"]
  spec.email         = ["barton.tomas@gmail.com"]
  spec.description   = %q{A Ruby/Rake DSL for building and packaging software}
  spec.summary       = %q{Bagr provides simple DSL for building packages}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'fpm'
end
