class Mazer::SimpleNavigationRenderer < SimpleNavigation::Renderer::Base
  attr_reader :item_container

  def render(item_container)
    @item_container = item_container
    classes = (item_container.level == 1) ? "menu"
                                          : "submenu"
    classes += " active" if item_container.selected?
    content = "<ul class=\"#{ classes }\">"
    item_container.items.each do |item|
      content << make(item)
    end
    content << "</ul>"
    content.html_safe
  end

  protected

  def make(item)
    classes = item.html_options[:class].to_s
    classes += (item_container.level == 1)  ? " sidebar-item"
                                            : " submenu-item"
    classes += " has-sub" if item.sub_navigation
    li = "<li class=\"#{ classes }\">"
    li += make_a(item)
    li += render_sub_navigation_for(item) if item.sub_navigation
    li += "</li>"
    li
  end

  def make_a(item)
    icon = item.public_send(:options)[:icon]
    a = "<a href=\"#{ item.url }\""
    a += " class=\"sidebar-link\"" if item_container.level == 1
    a += ">"
    a += "<i class=\"#{ icon }\"></i>" if icon
    a += "<span>#{ item.name }</span></a>"
    a
  end
end
