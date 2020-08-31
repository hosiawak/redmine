require_dependency 'time_entry'

module TimeEntryPatch
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable

      validate :issue_is_open
    end
  end

  module ClassMethods; end

  module InstanceMethods
    def issue_is_open
      errors.add :base, :issue_closed, message: "Cannot add time to a closed issue" if issue.closed?
    end
  end
end
