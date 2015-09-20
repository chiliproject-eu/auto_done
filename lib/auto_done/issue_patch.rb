require_dependency 'issue'

module IssuePatch

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      before_validation :update_percent_done
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def update_percent_done
      if self.project && self.project.enabled_module(:set_percent_done_to_100_when_issues_are_closed)
        self.done_ratio = 100 if self.status && self.status.is_closed?
      end
      true
    end
  end

end

Issue.send(:include, IssuePatch)
