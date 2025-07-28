class SimpleNavigation::BootstrapRenderer < SimpleNavigation::Renderer::Base
  def render(item_container)
    content = '<ul class="navbar-nav">'
    dropdown = @options.fetch(:dropdown, true)

    item_container.items.each do |item|
      content << make(item, dropdown)
    end
    content << '</ul>'
    content.html_safe
  end

  protected

  def make(item, dropdown)
    has_dropdown = consider_sub_navigation?(item) && dropdown
    has_sub_navigation = consider_sub_navigation?(item)
    li = "<li class=\"nav-item"
    li += " dropdown" if has_dropdown
    li += " #{item.options.dig(:html, :class)}"
    li += "\">"
    li += make_a(item, dropdown)
    li += make_subnavigation(item, has_dropdown) if has_sub_navigation
    li += '</li>'
    li
  end

  def make_a(item, dropdown)
    has_sub_navigation = consider_sub_navigation?(item)
    a = "<a href=\"#{ item.url }\" class=\"nav-link"
    a += " active" if item.selected?
    a += " dropdown-toggle" if has_sub_navigation && dropdown
    a += " #{item.options.dig(:link_html, :class)}"
    a += "\""
    a += " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"" if has_sub_navigation && dropdown
    a += ">"
    a += item.name
    a += "</a>"
    a
  end

  def make_subnavigation(item, dropdown)
    ul = "<ul class=\"list-unstyled"
    ul += " dropdown-menu dropdown-menu-lg-end" if dropdown
    ul += "\">"
    item.sub_navigation.items.each do |i|
      ul += "<li>"
      ul += "<a href=\"#{ i.url }\""
      ul += "class=\"dropdown-item\"" if dropdown
      ul += ">"
      ul += i.name
      ul += "</a>"
      ul += "</li>"
    end
    ul += "</ul>"
    ul
  end
end
