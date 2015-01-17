module ActiveAdmin
  module ActiveRecord
    module ViewHelpers
      module DisplayHelper

        DISPLAY_NAME_FALLBACK = ->{
          name, klass = "", self.class
          name << klass.model_name.human         if klass.respond_to? :model_name
          name << " ##{send(klass.primary_key)}" if klass.respond_to? :primary_key
          name.present? ? name : to_s
        }
        def DISPLAY_NAME_FALLBACK.inspect
          'DISPLAY_NAME_FALLBACK'
        end


        def linkable?(object)
          object.is_a?(::ActiveRecord::Base)
        end

      end
    end
  end
end
