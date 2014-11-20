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

      end
    end # Document
  end
end

Mongoid::Document.send :include, ActiveAdmin::Mongoid::Document
