module ActiveAdmin
  module ObjectMapper
    class AbstractAdapter
      attr_accessor :base

      def initialize(base)
        @base = base
      end

      def method_missing(m, *args, &block)
        if base.respond_to?(m)
          base.send(m, *args, &block)
        else
          super(m, *args, &block)
        end
      end

      def respond_to_missing?(m, include_private)
        base.respond_to?(m, include_private)
      end
    end
  end
end
