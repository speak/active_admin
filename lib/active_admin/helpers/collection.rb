module ActiveAdmin
  module Helpers
    module Collection
      def collection_is_empty?(c = collection)
        collection_size(c) == 0
      end
    end
  end
end
