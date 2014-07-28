# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_ghost_importer'

Gem::Specification.new do |spec|
  spec.name          = "jekyll_ghost_importer"
  spec.version       = JekyllGhostImporter::VERSION
  spec.authors       = ["Eloy Espinaco"]
  spec.email         = ["eloyesp@gmail.com"]
  spec.summary       = %q{Import your posts from a ghost backup file.}
  spec.homepage      = ""
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-cucumber"
end
