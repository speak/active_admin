module ActiveAdmin
  module ObjectMapper
    class AbstractAdapter
      attr_accessor :base

      def initialize(base)
        @base = base
      end
    end
  end
end
