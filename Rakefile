require "bundler/gem_tasks"
require 'ra11y'

task :default => [:spec]

require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  puts "Pa11y version: #{Ra11y.executable_version}"
  puts "Pa11y path: #{Cliver.detect('pa11y')}"
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = ["--order", "rand", "--color"]
end
