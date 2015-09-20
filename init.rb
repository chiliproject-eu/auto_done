Redmine::Plugin.register :auto_done do
  name 'Auto Done'
  author 'ChiliProject.eu'
  description 'Adds a project module, which when enabled sets percent done to 100 on issues that are closed'
  version '0.0.1'
  url 'http://www.chiliproject.eu/projects/chiliproject-eu/wiki/Auto_Done_Plugin'
  author_url 'http://www.chiliproject.eu'

  project_module :set_percent_done_to_100_when_issues_are_closed do
    permission nil, {}, public: true
  end
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'auto_done/issue_patch'
end
