require "ra11y/version"
require "ra11y/site"
require "ra11y/html_file"
require "ra11y/result"
require "open3"
require 'json'
require 'logger'
require 'colorator'
require 'parallel'
require 'cliver'

module Ra11y
  class Pa11yError < StandardError; end

  DEFAULTS = {
    :executable => "pa11y",
    :reporter   => "json",
    :htmlcs     => "file://#{File.expand_path("vendor/htmlcs.js", File.dirname(__FILE__))}"
  }

  PORT = 3100

  class << self

    attr_writer :options

    def options
      DEFAULTS.merge(@options || {}).merge({ :port => (PORT + Thread.list.count).to_s })
    end

    def flags
      options.reject { |k,v| k == :executable }.map { |k,v| ["--#{k}", v] }.flatten
    end

    def run_command(*args)
      Cliver.assert('pa11y', "~> 2.0")
      output, status = Open3.capture2e(options[:executable], *flags, *args)
      raise Pa11yError, output if status.exitstatus == 1
      output
    end

    def executable_version
      run_command("--version").strip
    end
  end
end
