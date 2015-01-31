module ActiveAdmin
  module Mongoid
    module Filters
      module FormBuilder

        def filter(method, options = {})
          if method.present? && options[:as] ||= default_mongoid_input_type(method)
            if reflection_for(method)
              # ransack/formtastic adds suffix '_id'
              template.concat input(method.to_s.chomp('_id'), options)
            else
              template.concat input(method, options)
            end
          end
        end

        protected

        def default_mongoid_input_type(method, options = {})
          if method =~ /_(eq|equals|cont|contains|start|starts_with|end|ends_with)\z/
            :string
          elsif klass._ransackers.key?(method.to_s)
            klass._ransackers[method.to_s].type
          elsif reflection_for(method) || polymorphic_foreign_type?(method)
            :select
          elsif column = column_for(method)
            case column.type.to_s
            when 'Time', 'DateTime'
              :date_range
            when 'String', 'BSON::ObjectId'
              :string
            when 'Float', 'Integer'
              :numeric
            when 'Mongoid::Boolean'
              :boolean
            end
          end
        end
      end
    end
  end
end

::ActiveAdmin::Filters::FormBuilder.send :include, ::ActiveAdmin::Mongoid::Filters::FormBuilder
