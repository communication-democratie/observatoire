SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = SimpleNavigation::BootstrapRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true

  navigation.items do |primary|
    primary.item  :problems, Problem.model_name.human(count: 2), problems_path
    primary.item  :more, 'En savoir plus' do |secondary|
      Page.ordered.each do |page|
        secondary.item page.slug.to_sym, page.title, "/#{page.slug}"
      end
    end
  end
end