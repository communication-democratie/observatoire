SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = ::Mazer::SimpleNavigationRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true
  navigation.selected_class = 'active'
  navigation.active_leaf_class = 'active-leaf'

  def badge(text, count)
    return text if count.zero?
    "#{text} <span class=\"badge rounded-pill text-bg-dark\">#{count} </span>"
  end

  navigation.items do |primary|
    primary.item  :dashboard,
                  t('admin.dashboard'),
                  admin_root_path,
                  { icon: 'bi bi-grid-fill', highlights_on: /admin$/ }
    primary.item  :reports, 
                  Report.model_name.human(count: 2),
                  nil,
                  { icon: 'bi bi-question-circle-fill' } do |secondary|
      Report::Step.ordered.each do |step|
        secondary.item  step.id.to_sym,
                        badge(step.to_s, step.reports.count),
                        admin_reports_path(step: step.id),
                        highlights_on: lambda {
                          controller_name == 'reports' && @step == step
                        }

      end
      secondary.item  :reports_all,
                      'Tous',
                      admin_reports_path,
                      highlights_on: lambda {
                        controller_name == 'reports' && @step.nil?
                      }
    end
    primary.item  :problems,
                  Problem.model_name.human(count: 2),
                  admin_problems_path,
                  { icon: 'bi bi-exclamation-circle-fill' } do |secondary|
      Problem::Step.ordered.each do |step|
        secondary.item  step.id.to_sym,
                        badge(step.to_s, step.problems.count),
                        admin_problems_path(step: step.id),
                        highlights_on: lambda {
                          controller_name == 'problems' && @step == step
                        }

      end
      secondary.item  :problems_all,
                      'Tous',
                      admin_problems_path,
                      highlights_on: lambda {
                        controller_name == 'problems' && @step.nil?
                      }
    end
    primary.item  :taxonomies,
                  Taxonomy.model_name.human(count: 2),
                  nil,
                  { icon: 'bi bi-tag-fill' } do |secondary|
      Taxonomy.ordered.each do |taxonomy|
        secondary.item  taxonomy.id.to_sym,
                      taxonomy.to_s,
                      admin_taxonomy_path(taxonomy),
                      {
                        highlights_on: lambda {
                          @taxonomy == taxonomy || @category&.taxonomy == taxonomy
                        }
                      }
      end
    end
    primary.item  :pages,
                  'Pages statiques',
                  admin_pages_path,
                  { icon: 'bi bi-pen-fill' }
    primary.item  :organisations,
                  'Organisations',
                  admin_organizations_path,
                  { icon: 'bi bi-building-fill' }
    primary.item  :analytics,
                  'Analytics',
                  admin_analytics_path,
                  { icon: 'bi bi-building-fill' }
    primary.item  :settings,
                  'Réglages',
                  nil,
                  { icon: 'bi bi-gear-fill' } do |secondary|
      secondary.item  :report_steps,
                      Report::Step.model_name.human(count: 2),
                      admin_reports_steps_path
      secondary.item  :problem_steps,
                      Problem::Step.model_name.human(count: 2),
                      admin_problems_steps_path
    end
  end
end