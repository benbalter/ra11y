require "bundler/setup"

ENV['RACK_ENV'] = 'test'
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'ra11y'

def fixtures_path
  File.expand_path "./fixtures", File.dirname(__FILE__)
end
