require_dependency 'issue'

module IssuePatch
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable
    end
  end

  module ClassMethods; end

  module InstanceMethods
    def invoiced?
      # NOTE:
      # 'Invoiced' custom_field is ID 13.
      # 'Client Invoiced' custom_field is ID 23. 'Client Invoiced' does not exist on QA.
      custom_field_values.find { |cfv| (cfv.custom_field.name == 'Client Invoiced' && cfv.value.present?) || (cfv.custom_field.name == 'Invoiced' && cfv.value == "1") }
    end
  end
end
