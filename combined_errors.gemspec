# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'combined_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "combined_errors"
  spec.version       = CombinedErrors::VERSION
  spec.authors       = ["Mark Sim"]
  spec.email         = ["mark@blog.quarternotecoda.com"]
  spec.description   = %q{Combine Model errors into a new single property for use with gems like SimpleForm}
  spec.summary       = %q{Combine Model errors into a new single property}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
