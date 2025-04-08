# == Schema Information
#
# Table name: pages
#
#  id         :uuid             not null, primary key
#  markdown   :text
#  position   :integer
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Page < ApplicationRecord

  scope :ordered, -> { order(:position) }

  def html
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, with_toc_data: true)
    redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})
    redcarpet.render(markdown).html_safe
  end

  def toc
    renderer = Redcarpet::Render::HTML_TOC
    redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})
    redcarpet.render(markdown).html_safe
  end

  def to_s
    "#{title}"
  end
end
