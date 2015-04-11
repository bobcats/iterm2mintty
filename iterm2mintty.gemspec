# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iterm2mintty/version'

Gem::Specification.new do |spec|
  spec.name          = "iterm2mintty"
  spec.version       = Iterm2mintty::VERSION
  spec.authors       = ["Brian Field"]
  spec.email         = ["brian@madsalty.com"]
  spec.summary       = %q{Tool for converting terminal themes from iTerm2 to mintty}
  spec.description   = %q{}
  spec.homepage      = "http://www.github.com/bobcats/iterm2mintty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["iterm2mintty"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "plist", "~> 3.1"
end
