module ActiveAdmin
  module ActiveRecord
    module Helpers
      module Collection

        protected

        # 1. removes `select` and `order` to prevent invalid SQL
        # 2. correctly handles the Hash returned when `group by` is used
        def collection_size(c = collection)
          c = c.except :select, :order

          c.group_values.present? ? c.count.count : c.count
        end
      end
    end
  end
end
