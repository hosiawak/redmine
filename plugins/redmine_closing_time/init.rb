require 'redmine'

require_dependency 'redmine_closing_time/issue_patch'
require_dependency 'redmine_closing_time/time_entry_patch'

Redmine::Plugin.register :redmine_closing_time do
  name 'Redmine Closing Time'
  author 'Thom Bruce'
  description 'Redmine Closing Time is a plugin which adds a custom validation to time entries so that they cannot be added on closed issues.'
  version '0.1.0'
end

Issue.send(:include, RedmineClosingTime::IssuePatch)
TimeEntry.send(:include, RedmineClosingTime::TimeEntryPatch)
