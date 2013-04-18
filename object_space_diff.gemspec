# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'object_space_diff/version'

Gem::Specification.new do |gem|
  gem.name          = "object_space_diff"
  gem.version       = ObjectSpaceDiff::VERSION
  gem.authors       = ["Ervin Weber"]
  gem.email         = ["webervin@gmail.com"]
  gem.description   = "Gem helps analyze object space before and after yielding a block"
  gem.summary       = "Gives insight to code leaks or unnecessary string initialization"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
