module ActiveAdmin
  module ActiveRecord
    module ViewHelpers
      module DisplayHelper


        def linkable?(object)
          object.class.include?(Mongoid::Document)
        end

      end
    end
  end
end
