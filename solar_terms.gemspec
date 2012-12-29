# -*- encoding: utf-8 -*-
require File.expand_path('../lib/solar_terms/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["xixilive"]
  gem.email         = ["xixilive@gmail.com"]
  gem.description   = %q{Chinese solar terms, mixin Date Class, Time Class and DateTime Class}
  gem.summary       = %q{Chinese solar terms}
  gem.homepage      = "http://github.com/xixilive/solar_terms"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "solar_terms"
  gem.require_paths = ["lib"]
  gem.version       = SolarTerms::VERSION
end
