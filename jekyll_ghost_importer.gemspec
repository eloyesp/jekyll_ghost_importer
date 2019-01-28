# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "jekyll_ghost_importer"
  spec.version       = "1.0.0"
  spec.authors       = ["Eloy Espinaco"]
  spec.email         = ["eloyesp@gmail.com"]
  spec.summary       = %q{Import your posts from a ghost backup file.}
  spec.homepage      = ""
  spec.license       = "GPL-3.0+"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "reverse_markdown", '~> 1.1'
  spec.add_development_dependency "cucumber", '~> 1.3'
  spec.add_development_dependency "aruba",    '~> 0'
end
