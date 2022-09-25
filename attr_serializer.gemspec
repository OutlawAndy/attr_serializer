# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attr_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "attr_serializer"
  spec.version       = AttrSerializer::VERSION
  spec.authors       = ["Andy Cohen"]
  spec.email         = ["yourstruly@outlawandy.com"]

  spec.summary       = "easy JSON serialization for ActiveRecord models"
  spec.description   = "quickly specify model attributes that should be serialized when to_json is called"
  spec.homepage      = "https://github.com/OutlawAndy/attr_serializer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
