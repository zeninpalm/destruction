module Destruction
  module Array
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
        indexes = {}
        seen_stars = false
        stars = []
        self_dup = self.clone
        reversed = 0
        
        patterns.each_with_index do |s, i|
          if s.to_s.start_with? '*'
            stars = self_dup
            eval "@context.#{s.to_s[1..-1]} = stars"
            self_dup = nil
          elsif s == '_'
            self_dup.shift
          else
            if self_dup
              val = self_dup.shift
              eval "@context.#{s.to_s} = val"
            else
              index = i - patterns.length
              eval "@context.#{s.to_s} = stars[#{index}]"
              reversed += 1
            end
          end
        end
        reversed.times { stars.pop }
      end
    end    
  end
end
