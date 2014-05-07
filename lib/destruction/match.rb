module Destruction
  module Match
    def self.included(klass)
      define_method(:match) do |&block|
        instance_eval &block
      end
      klass.extend(MacroMethods)
    end
    
    def method_missing(name)
      @result
    end
    
    def let(assignments)
      names = assignments.keys
      @context = Context.new(*names)
      names.each do |n|
        eval "@context.#{n.to_s}= assignments[n]"
      end
    end
    
    module MacroMethods
      def matches(pattern_symbol)
        define_method(pattern_symbol) do |&block|
          @result = @context.instance_eval &block
        end
      end      
    end
  end
end
