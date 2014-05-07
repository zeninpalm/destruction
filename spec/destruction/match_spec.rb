require 'spec_helper'

class Either
  include Destruction::Match
end

class Left < Either
  matches :Left
end

class Right < Either
  matches :Right
end

describe Destruction::Match do
  
  it "adds match method" do
    e = Either.new
    expect(e).to respond_to(:match)
  end
  
  it "adds let method" do
    e = Either.new
    expect(e).to respond_to(:let)
  end
  
  it "adds matches class macro" do
    expect(Either).to respond_to(:matches)
  end
  
  
  it "executes corresponding block if matched" do
    e = Left.new
    r = e.match do
      Left { "Left matched" }
      Right { "Right matched" }
    end
    expect(r).to be_eql("Left matched")
  end
  
  context "setting up local variables in let" do    
   it "executes corresponding block with values given in 'let'" do
     e = Left.new
     r = e.match do
       let u: 2, v: 3, w: 10
       Left { u + v + w }
       Right { }
     end
     expect(r).to be_eql(15)
   end
 end
 
end
