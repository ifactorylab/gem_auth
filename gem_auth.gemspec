# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "gem_auth"
  spec.version       = GemAuth::VERSION
  spec.authors       = ["minsikzzang"]
  spec.email         = ["minsikzzang@gmail.com"]
  spec.description   = %q{Venice authentication gem}
  spec.summary       = %q{Venice authentication gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'uuidtools', '>=2.1'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
