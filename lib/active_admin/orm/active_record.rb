# ActiveRecord-specific plugins should be required here

ActiveAdmin::DatabaseHitDuringLoad.database_error_classes << ::ActiveRecord::StatementInvalid

require 'active_admin/orm/active_record/filters/forms'
require 'active_admin/orm/active_record/filters/formtastic_addons'
require 'active_admin/orm/active_record/filters/resource_extension'
require 'active_admin/orm/active_record/helpers/collection'
require 'active_admin/orm/active_record/view_helpers/display_helper'
require 'active_admin/orm/active_record/views/components/table_for'
require 'active_admin/orm/active_record/views/index_as_table'
require 'active_admin/orm/active_record/resource'
require 'active_admin/orm/active_record/resource_collection'
require 'active_admin/orm/active_record/comments'


ActiveAdmin::Filters::FormBuilder.send :include, ActiveAdmin::ActiveRecord::Filters::FormBuilder
ActiveAdmin::Filters::FormBuilder.send :include, ActiveAdmin::ActiveRecord::Filters::FormtasticAddons
ActiveAdmin::Filters::FormtasticAddons.send :include, ActiveAdmin::ActiveRecord::Filters::FormtasticAddons
ActiveAdmin::Resource.send :include, ActiveAdmin::ActiveRecord::Filters::ResourceExtension
ActiveAdmin::Helpers::Collection.send :include, ActiveAdmin::ActiveRecord::Helpers::Collection
ActiveAdmin::Views::Pages::Index.send :include, ActiveAdmin::ActiveRecord::Helpers::Collection
ActiveAdmin::Views::PaginatedCollection.send :include, ActiveAdmin::ActiveRecord::Helpers::Collection
ActiveAdmin::Views::Scopes.send :include, ActiveAdmin::ActiveRecord::Helpers::Collection
ActiveAdmin::ViewHelpers::DisplayHelper.send :include, ActiveAdmin::ActiveRecord::ViewHelpers::DisplayHelper
ActiveAdmin::ViewHelpers.send :include, ActiveAdmin::ActiveRecord::ViewHelpers::DisplayHelper
ActiveAdmin::Views::TableFor.send :include, ActiveAdmin::ActiveRecord::Views::TableFor
ActiveAdmin::Views::TableFor::Column.send :include, ActiveAdmin::ActiveRecord::Views::TableFor::Column
ActiveAdmin::Views::IndexAsTable.send :include, ActiveAdmin::ActiveRecord::Views::IndexAsTable
ActiveAdmin::Views::IndexAsTable::IndexTableFor.send :include, ActiveAdmin::ActiveRecord::Views::IndexTableFor
ActiveAdmin::Resource.send :include, ActiveAdmin::ActiveRecord::Resource
ActiveAdmin::ResourceCollection.send :include, ActiveAdmin::ActiveRecord::ResourceCollection
