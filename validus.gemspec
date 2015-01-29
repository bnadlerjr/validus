# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bob Nadler, Jr."]
  gem.email         = ["bnadlerjr@gmail.com"]
  gem.description   = %q{Valdations for Plain Old Ruby Objects.}
  gem.summary       = %q{Valdations for Plain Old Ruby Objects.}
  gem.homepage      = "https://github.com/bnadlerjr/validus"
  gem.has_rdoc      = true
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "validus"
  gem.require_paths = ["lib"]
  gem.version       = Validus::VERSION

  gem.add_development_dependency "contest", "~> 0.1.3"
  gem.add_development_dependency "flay",    "~> 2.6.0"
  gem.add_development_dependency "flog",    "~> 4.3.0"
  gem.add_development_dependency "rake",    "~> 10.4.2"
  gem.add_development_dependency "rdoc",    "~> 4.2.0"
end
