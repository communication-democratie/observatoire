class MarkdownRenderer
  attr_reader :markdown

  SHORTCODES = [
    :partners,
    :members
  ]

  def initialize(markdown)
    @markdown = markdown
  end

  def toc
    unless @toc
      renderer = Redcarpet::Render::HTML_TOC.new(nesting_level: 2)
      redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})
      @toc = redcarpet.render(markdown).html_safe
    end
    @toc
  end

  def html
    unless @html
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, with_toc_data: true)
      redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})
      @html = "<div class=\"markdown\">#{redcarpet.render(markdown)}</div>".html_safe
      @html = convert_shortcodes(@html)
      @html = @html.html_safe
    end
    @html
  end

  def h2_titles
    @h2_titles ||= Nokogiri::HTML(toc).xpath('//a').map do |node|
      slug = node.text.parameterize
      [
        node.text,
        node.attributes['href'].value,
        node.set_attribute('id', slug)
      ]
    end
  end

  protected

  def convert_shortcodes(html)
    SHORTCODES.each do |shortcode|
      placeholder = "[#{shortcode}]"
      html = html.split(placeholder)
                 .join(render(shortcode))
                 .html_safe
    end
    html
  end

  def render(shortcode)
    ApplicationController.render partial: "shortcodes/#{shortcode}"
  end
end
