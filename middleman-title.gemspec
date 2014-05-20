# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-title/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-title'
  spec.version       = Middleman::Title::VERSION
  spec.authors       = ['Justin Cypret']
  spec.email         = ['jcypret@gmail.com']
  spec.summary       = 'A Middleman extension for setting the page title'
  spec.homepage      = 'https://github.com/jcypret/middleman-title'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'middleman-core', '~> 3.2'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.3.1'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
end
