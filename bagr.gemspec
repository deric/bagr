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
  spec.summary       = %q{Build pAckages like a GuRu}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake', '>= 10.1.0'
  spec.add_dependency 'fpm'
  spec.add_dependency 'i18n'

  spec.add_development_dependency 'rspec'
end
