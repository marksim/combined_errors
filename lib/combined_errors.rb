require "combined_errors/version"

module CombinedErrors
  module Model
    def combine_errors new_method, *methods_to_combine
      define_method new_method do
        methods_to_combine.flatten.each do |m|
          if errors[m].any?
            title = m.to_s.respond_to?(:titleize) ? m.titleize : m.capitalize
            errors[m].each do |error|
              errors.add(new_method, "#{title} #{error}")
            end
          end
        end
        nil
      end
    end
  end
end

if defined?(ActiveRecord)
  ActiveRecord::Base.extend CombinedErrors::Model
end
