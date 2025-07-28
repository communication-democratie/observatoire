SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = SimpleNavigation::BootstrapRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true

  navigation.items do |primary|
    primary.item  :analyzed_problems, 'Nos analyses', analyzed_problems_path
    Page.ordered.each do |page|
      primary.item page.slug.to_sym, page.title, "/#{page.slug}" do |secondary|
        page.h2_titles.each do |title, anchor|
          secondary.item anchor.to_sym, title, "/#{page.slug}#{anchor}"        
        end
      end
    end
  end
end