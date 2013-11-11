# -*- encoding: utf-8 -*-
require File.expand_path('../lib/Practica9/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Coromoto Leon"]
  gem.email         = ["cleon@ull.edu.es"]
  gem.description   = %q{Esqueleto de una gema}
  gem.summary       = %q{Esqueleto de una gema}
  gem.homepage      = "https://github.com/coromoto/Practica9.git"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "Practica9"
  gem.require_paths = ["lib"]
  gem.version       = Practica9::VERSION
end
