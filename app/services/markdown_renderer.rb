class MarkdownRenderer
  attr_reader :markdown

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
      [
        node.text,
        node.attributes['href'].value
      ]
    end
  end

  protected

  def convert_shortcodes(html)
    html.split('[partners]')
        .join(shortcode_partners)
        .html_safe
  end

  def shortcode_partners
    ApplicationController.render partial: "shortcodes/partners"
  end
end