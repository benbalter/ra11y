require "spec_helper"

describe "Ra11y::Result" do

  before do
    @result = Ra11y::Result.new({ "code" => "foo", "message" => "bar", "type" => "error" })
  end

  it "stores the hash" do
    expect(@result.code).to eql("foo")
    expect(@result.message).to eql("bar")
    expect(@result.type).to eql("error")
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
end
