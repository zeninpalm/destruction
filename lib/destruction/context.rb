module Destruction
  class Context
    def initialize(*names)
      self.class.define_accessors(names)
    end
    
    
    private
    def self.define_accessors(names) 
      names.each do |n|
        if n.to_s.start_with?('*')
          attr_accessor n.to_s[1..-1].to_sym
        else
          attr_accessor n
        end
      end    
    end
  end
end