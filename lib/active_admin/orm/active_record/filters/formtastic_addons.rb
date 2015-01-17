module ActiveAdmin
  module ActiveRecord
    module Filters
      module FormtasticAddons

        def reflection_for(method)
          klass.reflect_on_association(method) if klass.respond_to? :reflect_on_association
        end

        def column_for(method)
          klass.columns_hash[method.to_s] if klass.respond_to? :columns_hash
        end

        def polymorphic_foreign_type?(method)
          klass.reflect_on_all_associations.select{ |r| r.macro == :belongs_to && r.options[:polymorphic] }
            .map(&:foreign_type).include? method.to_s
        end

      end
    end
  end
end
