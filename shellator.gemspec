
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shellator/version"

Gem::Specification.new do |spec|
  spec.name          = "shellator"
  spec.version       = Shellator::VERSION
  spec.authors       = ["Ed Ropple"]
  spec.email         = ["ed@edropple.com"]

  spec.summary       = "A small library to wrap popen3 for easier shell use."
  spec.homepage      = "https://github.com/eropple/shellator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
