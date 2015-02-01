# ActiveRecord-specific plugins should be required here

ActiveAdmin::DatabaseHitDuringLoad.database_error_classes << ActiveRecord::StatementInvalid

require 'active_admin/object_mapper/active_record/comments'

require 'active_admin/object_mapper/active_record/adapters/form_builder_adapter'

module ActiveAdmin
  module ObjectMapper
    module ActiveRecord

      ADAPTERS = [ :form_builder ]

      ADAPTERS.each do |adapter|
        klass = "ActiveAdmin::ObjectMapper::ActiveRecord::#{adapter.to_s.classify}Adapter".constantize
        define_singleton_method adapter do |base|
          klass.new(base)
        end
      end

    end
  end
end
