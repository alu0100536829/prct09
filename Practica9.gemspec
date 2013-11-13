# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/Practica9/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Teno Gonzalez","Albano Yanes"]
  gem.email         = ["alu0100536829@ull.edu.es"]
  gem.description   = %q{Esqueleto de una gema}
  gem.summary       = %q{Esqueleto de una gema}
  gem.homepage      = "https://github.com/alu0100536829/prct09.git"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "Practica9"
  gem.require_paths = ["lib"]
  gem.version       = Practica9::VERSION
end


Gem::Specification.new do |spec|
  spec.name          = "Practica9"
  spec.version       = MathExpansion::VERSION
  spec.authors       = ["Teno Gonzalez","Albano Yanes"]
  spec.email         = ["alu0100698121@ull.edu.es","alu0100699494"]
  spec.description   = %q{Permite la creación y uso de matrices densas y dispersas.}
  spec.summary       = %q{Matrices densas y dispersas}
  spec.homepage      = "https://github.com/alu0100536829/prct09.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end