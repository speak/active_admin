module ActiveAdmin
  module ActiveRecord
    module Views

      module IndexAsTable

        def default_table
          proc do
            selectable_column
            id_column if resource_class.primary_key # View based Models have no primary_key
            resource_class.content_columns.each do |col|
              column col.name.to_sym
            end
            actions
          end
        end
      end

      module IndexTableFor

        # Display a column for the id
        def id_column
          raise "#{resource_class.name} as no primary_key!" unless resource_class.primary_key
          column(resource_class.human_attribute_name(resource_class.primary_key), sortable: resource_class.primary_key) do |resource|
            if controller.action_methods.include?('show')
              link_to resource.id, resource_path(resource), class: "resource_id_link"
            else
              resource.id
            end
          end
        end
      end

    end
  end
end
