require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
Bundler.setup

require 'middleman-title/extension'

RSpec.configure do |config|
  # some (optional) config here
end