module ActiveAdmin
  module ActiveRecord
    module Filters
      module FormBuilder

        def filter(method, options = {})
          if method.present? && options[:as] ||= default_input_type(method)
            template.concat input(method, options)
          end
        end

      end
    end
  end
end
