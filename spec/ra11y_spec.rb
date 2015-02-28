require "spec_helper"

describe "Ra11y" do

  before(:each) do
    Ra11y.options = {}
  end

  it "returns the executable version" do
    expect(Ra11y.executable_version).to match(/\d\.\d\.\d/)
  end

  it "runs a command" do
    expect(Ra11y.run_command("--help")).to match(/Usage/)
  end

  it "defaults to the default options" do
    expect(Ra11y.options[:executable]).to eql("pa11y")
  end

  it "allows users to set options" do
    Ra11y.options = { :foo => "bar" }
    expect(Ra11y.options[:foo]).to eql("bar")
  end

  it "allows users to override the defaults" do
    Ra11y.options = { :executable => "foo" }
    expect(Ra11y.options[:executable]).to eql("foo")
  end
end
