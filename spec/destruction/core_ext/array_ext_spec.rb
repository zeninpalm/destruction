require 'spec_helper'

describe Destruction::Array do
  before do
    class Array
      include Destruction::Array::Includers
      extend Destruction::Array::Extenders
    end
  end
  
  it "responds to match" do
    a = [1, 2, 3]
    expect(a).to respond_to(:match)
  end
  
  it "destructures equally long array" do
    a = [4, 5, 6]
    v = a.match do
      _(:b, :c, :d) { b + c + d }
    end
    expect(v).to be_eql(15)
  end
  
  it "destructures longer array" do
    a = [4, 5, 6, 7, 8]
    v = a.match do
      _(:b, :c, :d) { b + c + d }
    end
    expect(v).to be_eql(15)
  end
  
  it "destructures shorter array" do
    a = [4, 5]
    v = a.match do
      _(:b, :c, :d) { d }
    end
    expect(v).to be_nil
  end
  
  it "supports '*' operator in the end" do
    a = [4, 5, 6, 7, 8]
    v = a.match do
      _(:b, :c, :'*others') { others }
    end
    expect(v).to be_eql([6, 7, 8])
  end
  
  it "supports '*' operator in the beginning" do
    a = [4, 5, 6, 7, 8]
    v = a.match do
      _(:'*others', :b, :c) { others }
    end
    expect(v).to be_eql([4,5,6])
  end
  
  it "supports '*' operator in the middle" do
    a = [4, 5, 6, 7, 8]
    v = a.match do
      _(:a, :'*others', :b, :c) { others }
    end
    expect(v).to be_eql([5,6])
  end
end
      