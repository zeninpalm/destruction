require 'spec_helper'

describe Destruction::Context do
  context "initialization" do
    it "adds accessors for given names" do
      c = Destruction::Context.new(:a, :b, :c, :'*others')
      expect(c).to respond_to(:a)
      expect(c).to respond_to(:b)
      expect(c).to respond_to(:c)
      expect(c).to respond_to(:others)
      
      expect(c).to respond_to(:a=)
      expect(c).to respond_to(:b=)
      expect(c).to respond_to(:c=)
      expect(c).to respond_to(:others)
    end
  end
end