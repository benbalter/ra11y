require "spec_helper"

describe "Ra11y::HtmlFile" do

  before do
    @file = Ra11y::HtmlFile.new File.expand_path("index.html", fixtures_path)
    @perfect = Ra11y::HtmlFile.new File.expand_path("perfect.html", fixtures_path)
  end

  it "should store the path" do
    expect(@file.path).to eql(File.expand_path("index.html", fixtures_path))
  end

  it "should know when a file is perfect" do
    expect(@perfect.perfect?).to eql(true)
  end

  it "should know when a file isn't perfect" do
    expect(@file.perfect?).to eql(false)
  end

  it "returns the results" do
    expect(@file.results.first.class).to eql(Ra11y::Result)
    expect(@file.results.count).to eql(6)
  end

  it "returns the errors" do
    expect(@file.errors.count).to eql(2)
  end

  it "returns the warnings" do
    expect(@file.warnings.count).to eql(1)
  end

  it "returns the notices" do
    expect(@file.notices.count).to eql(3)
  end
end
