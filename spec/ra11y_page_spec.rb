require "spec_helper"

describe "Ra11y::Page" do

  before do
    @page = Ra11y::Page.new("home_page", "<html><body></body><img src='foo' alt='redundant'><h1>redundant</h1></img></html>")
  end

  it "returns errors, warnings, and notices" do
    errors, warnings, notices = @page.run
    
    expect(errors).to(respond_to(:length))
    expect(warnings).to(respond_to(:length))
    expect(notices).to(respond_to(:length))
  end
end
