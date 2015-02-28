require "ra11y/version"
require "ra11y/site"
require "ra11y/html_file"
require "ra11y/result"
require "open3"
require 'json'
require 'logger'
require 'colorator'
require 'parallel'

module Ra11y

  DEFAULTS = {
    :executable => "pa11y",
    :reporter   => "json",
    :htmlcs     => "file://#{File.expand_path("vendor/htmlcs.js", File.dirname(__FILE__))}"
  }

  def self.options=(hash)
    @options=hash
  end

  def self.options
    DEFAULTS.merge(@options || {})
  end

  def self.flags
    options.reject { |k,v| k == :executable }.map { |k,v| ["--#{k}", v] }.flatten
  end

  def self.run_command(*args)
    output, status = Open3.capture2e(options[:executable], *flags, *args)
    output
  end

  def self.executable_version
    run_command("--version").strip
  end
end
