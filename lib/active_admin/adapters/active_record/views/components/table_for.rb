module ActiveAdmin
  module ActiveRecord
    module Views
      module TableFor

        def is_boolean?(data, item)
          if item.respond_to? :has_attribute?
            item.has_attribute?(data) &&
              item.column_for_attribute(data) &&
              item.column_for_attribute(data).type == :boolean
          end
        end

        module Column

          def sortable?
            if @options.has_key?(:sortable)
              !!@options[:sortable]
            elsif @resource_class
              @resource_class.column_names.include?(sort_column_name)
            else
              @title.present?
            end
          end
        end

      end
    end
  end
end
