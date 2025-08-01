# == Schema Information
#
# Table name: organizations
#
#  id          :uuid             not null, primary key
#  description :text
#  level       :integer          default("member")
#  name        :string
#  short_name  :string
#  slug        :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Organization < ApplicationRecord
  include WithSlug

  scope :ordered, -> { order(:name) }

  enum :level, {
    member: 0,
    partner: 1
  }

  has_one_attached :logo
  has_one_attached :logo_bw
  has_and_belongs_to_many :problems

  validates_presence_of :name

  delegate  :html, :toc, :h2_titles,
            to: :markdown_renderer

  def to_s
    "#{name}"
  end

  protected

  def markdown_renderer
    @markdown_renderer ||= MarkdownRenderer.new(description)
  end
end
