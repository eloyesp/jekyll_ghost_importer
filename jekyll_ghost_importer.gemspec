# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "jekyll_ghost_importer"
  spec.version       = "0.3.0"
  spec.authors       = ["Eloy Espinaco"]
  spec.email         = ["eloyesp@gmail.com"]
  spec.summary       = %q{Import your posts from a ghost backup file.}
  spec.homepage      = ""
  spec.license       = "GPL-3.0+"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
end
