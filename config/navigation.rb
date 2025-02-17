SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = SimpleNavigation::BootstrapRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true

  navigation.items do |primary|
    primary.item  :problems, Problem.model_name.human(count: 2), problems_path
    Taxonomy.all.ordered.each do |taxonomy|
      primary.item taxonomy.slug.to_sym, taxonomy.to_s, taxonomy.slug
    end
  end
end