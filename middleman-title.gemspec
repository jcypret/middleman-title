# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-title/version'

Gem::Specification.new do |s|
  s.name        = 'middleman-title'
  s.version     = Middleman::Title::VERSION
  s.license     = 'MIT'
  s.summary     = 'A Middleman extension for setting the page title'
  s.description = 'A Middleman extension for setting the page title'
  s.author      = 'Justin Cypret'
  s.email       = 'jcypret@gmail.com'
  s.homepage    = 'https://github.com/jcypret/middleman-title'

  s.files         = `git ls-files`.split($/)
  # s.test_files    = `git ls-files -- {features,fixtures}/*`.split($/)
  s.require_paths = ['lib']

  s.add_dependency 'middleman-core', '~> 3.2'

  s.add_development_dependency 'rspec'
end