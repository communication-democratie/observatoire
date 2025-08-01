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
  include WithSlug

  scope :with_position, -> { where.not(position: nil) }
  scope :ordered, -> { order(:position) }

  delegate  :html, :toc, :h2_titles,
            to: :markdown_renderer

  def to_s
    "#{title}"
  end

  def markdown_renderer
    @markdown_renderer ||= MarkdownRenderer.new(markdown)
  end
end
