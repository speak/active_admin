module ActiveAdmin
  module ActiveRecord
    module Resource

      def resource_table_name
        resource_class.quoted_table_name
      end

      def resource_column_names
        resource_class.column_names
      end

      def resource_quoted_column_name(column)
        resource_class.connection.quote_column_name(column)
      end

      def find_resource(id)
        resource = resource_class.public_send(method_for_find, id)
        decorator_class ? decorator_class.new(resource) : resource
      end

      private

      def method_for_find
        resources_configuration[:self][:finder] || :"find_by_#{resource_class.primary_key}"
      end

    end
  end
end
