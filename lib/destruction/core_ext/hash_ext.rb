module Destruction
  module Hash
    module Extenders
    end
    
    module Includers
      def match(&block)
        instance_eval &block
      end
      
      def _(*patterns, &block)
        @context = Destruction::Context.new(*patterns)
        setup_context(patterns)       
        @context.instance_eval &block
      end
      
      def setup_context(patterns)        
        patterns.each_with_index do |s, i|        
          eval "@context.#{s.to_s} = self[s]"        
        end
      end
    end    
  end
end
