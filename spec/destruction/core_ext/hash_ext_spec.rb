require 'spec_helper'

describe Destruction::Hash do
  before do
    class Hash
      include Destruction::Hash::Includers
      extend Destruction::Hash::Extenders
    end
  end
  
  it "responds to match" do
    a = {a: 1, b: 2, c: 3}
    expect(a).to respond_to(:match)
  end
  
  it "destructures equally long hash" do
    r = {a: 1, b: 2, c: 3}
    v = r.match do
      _(:a, :b, :c) { b + c + a }
    end
    expect(v).to be_eql(6)
  end
  
  it "destructures longer hash" do
    r = {a: 1, b: 2, c: 3, d: 4}
    v = r.match do
      _(:b, :c, :d) { b + c + d }
    end
    expect(v).to be_eql(9)
  end
  
  it "destructures shorter hash" do
    r = {a: 1, b: 2}
    v = r.match do
      _(:b, :c, :d) { d }
    end
    expect(v).to be_nil
  end
  
  it "destructures nested hash" do
    r = {a: 1, b: { c: 3}}
    v = r.match do
      _(:a, :b) { b }
    end
    expect(v).to be_eql({c: 3})
  end
end
      