# ActiveRecord-specific plugins should be required here

ActiveAdmin::DatabaseHitDuringLoad.database_error_classes << ActiveRecord::StatementInvalid

require 'active_admin/object_mapper/active_record/comments'

module ActiveAdmin
  module ObjectMapper
    module ActiveRecord

      ADAPTERS = [ 'form_builder_adapter', 'formtastic_addons_adapter',
        'resource_extension_adapter' ]

      ADAPTERS.each do |adapter|
        require "active_admin/object_mapper/active_record/adapters/#{adapter}"

        klass = %[ActiveAdmin::ObjectMapper::ActiveRecord::#{adapter.classify}].constantize
        define_singleton_method adapter do |base|
          klass.new(base)
        end
      end

    end
  end
end
