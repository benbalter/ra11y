require "spec_helper"

describe "Ra11y::Site" do

  before do
    @site = Ra11y::Site.new(fixtures_path)
  end

  it "stores the path" do
    expect(@site.path).to eql(fixtures_path)
  end

  it "knows the path to html files" do
    expect(@site.paths.count).to eql(3)
    expected = File.expand_path "about.html", fixtures_path
    expect(@site.paths.first).to eql(expected)
  end

  it "builds the HTML files" do
    expect(@site.html_files.count).to eql(3)
    expect(@site.html_files.first.class).to eql(Ra11y::HtmlFile)
  end
end
