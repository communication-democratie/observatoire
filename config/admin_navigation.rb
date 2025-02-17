SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = ::Mazer::SimpleNavigationRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true
  navigation.selected_class = 'active'
  navigation.active_leaf_class = 'active'

  navigation.items do |primary|
    primary.item  :dashboard, t('admin.dashboard'), admin_root_path, { icon: 'bi bi-grid-fill', highlights_on: /admin$/ }
    primary.item  :reports, Report.model_name.human(count: 2), admin_reports_path, { icon: 'bi bi-exclamation-circle-fill' }
  end
end