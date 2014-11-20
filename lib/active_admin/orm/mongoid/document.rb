module ActiveAdmin
  module Mongoid
    module Document
      extend ActiveSupport::Concern

      included do
        
      end

      module ClassMethods

        def quoted_table_name
          collection_name.to_s.inspect
        end

        def column_names
          fields.map(&:first)
        end

        def content_columns
          fields.map(&:second).reject do |f|
            f.name =~ /^_/ || ::Mongoid::Fields::ForeignKey === f
          end
        end

        def primary_key
          :id
        end

      end
    end # Document
  end
end

Mongoid::Document.send :include, ActiveAdmin::Mongoid::Document
