SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = SimpleNavigation::BootstrapRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true

  navigation.items do |primary|
    primary.item  :problems, 'Pubs signalées', problems_path
    primary.item  :analyzed_problems, 'Nos analyses', analyzed_problems_path
    Page.ordered.each do |page|
      primary.item page.slug.to_sym, page.title, "/#{page.slug}"
    end
    primary.item  :button, 'Signaler', '/#reporting', html: { class: 'header-cta' }
  end
end