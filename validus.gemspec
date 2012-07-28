# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bob Nadler"]
  gem.email         = ["bnadlerjr@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "validus"
  gem.require_paths = ["lib"]
  gem.version       = Validus::VERSION

  gem.add_development_dependency "contest",            "~> 0.1.3"
  gem.add_development_dependency "flay",               "~> 1.4.3"
  gem.add_development_dependency "flog",               "~> 2.5.3"
  gem.add_development_dependency "minitest-reporters", "~> 0.9.0"
  gem.add_development_dependency "rake",               "~> 0.9.2.2"
  gem.add_development_dependency "rdoc",               "~> 3.12"
end