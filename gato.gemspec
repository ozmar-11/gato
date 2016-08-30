# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gato/version'

Gem::Specification.new do |spec|
  spec.name          = "gato"
  spec.version       = Gato::VERSION
  spec.authors       = ["ozmar-11"]
  spec.email         = ["ozmar_11@hotmail.com"]
  spec.summary       = %q{Provides the logic of the tic tac toe game}
  spec.description   = %q{This gem provide you the log of the tic tac toe game you just need declare the players (included in the gem) and the table(also included in the gem)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
