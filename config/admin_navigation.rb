SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = ::Mazer::SimpleNavigationRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true
  navigation.selected_class = 'active'
  navigation.active_leaf_class = 'active'

  navigation.items do |primary|
    primary.item  :dashboard,
                  t('admin.dashboard'),
                  admin_root_path,
                  { icon: 'bi bi-grid-fill', highlights_on: /admin$/ }
    primary.item  :reports, 
                  Report.model_name.human(count: 2),
                  admin_reports_path,
                  { icon: 'bi bi-question-circle-fill' }
    primary.item  :problems,
                  Problem.model_name.human(count: 2),
                  admin_problems_path,
                  { icon: 'bi bi-exclamation-circle-fill' }
    Taxonomy.all.each do |taxonomy|
      primary.item  taxonomy.id.to_sym,
                    taxonomy.to_s,
                    admin_taxonomy_path(taxonomy),
                    {
                      icon: 'bi bi-tag-fill',
                      highlights_on: lambda {
                        @taxonomy == taxonomy || @category&.taxonomy == taxonomy
                      }
                    }
    end
  end
end