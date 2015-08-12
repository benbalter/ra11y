require "spec_helper"

describe "Ra11y::Result" do

  before do
    @result = Ra11y::Result.new({
      "code"      => "foo",
      "message"   => "bar",
      "type"      => "error",
      "context"   => "<title>Pa11y - Your automated accessib...</title>",
      "selector"  => "html > head > title",
      "typeCode"  => 3,
    })
  end

  it "stores the hash" do
    expect(@result.code).to eql("foo")
    expect(@result.message).to eql("bar")
    expect(@result.type).to eql("error")
    expect(@result.context).to eql("<title>Pa11y - Your automated accessib...</title>")
    expect(@result.selector).to eql("html > head > title")
    expect(@result.type_code).to eql(3)
  end

  it "returns the hash" do
    hash = @result.to_hash
    expect(hash[:code]).to eql("foo")
    expect(hash[:message]).to eql("bar")
    expect(hash[:type]).to eql("error")
    expect(hash[:context]).to eql("<title>Pa11y - Your automated accessib...</title>")
    expect(hash[:selector]).to eql("html > head > title")
    expect(hash[:type_code]).to eql(3)
  end

  it "knows when its an error" do
    expect(@result.error?).to eql(true)
    expect(@result.warning?).to eql(false)
    expect(@result.notice?).to eql(false)
  end

  it "knows when its a notice" do
    result = Ra11y::Result.new({ "code" => "foo", "message" => "bar", "type" => "notice" })
    expect(result.error?).to eql(false)
    expect(result.warning?).to eql(false)
    expect(result.notice?).to eql(true)
  end

  it "knows when its a warning" do
    result = Ra11y::Result.new({ "code" => "foo", "message" => "bar", "type" => "warning" })
    expect(result.error?).to eql(false)
    expect(result.warning?).to eql(true)
    expect(result.notice?).to eql(false)
  end

  it "formats the string" do
    expect(@result.to_s).to match(/message: bar\n/)
  end
end
