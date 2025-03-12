# == Schema Information
#
# Table name: taxonomies
#
#  id          :uuid             not null, primary key
#  description :text
#  for_reports :boolean          default(FALSE)
#  position    :integer          default(0)
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Taxonomy < ApplicationRecord

  has_many :categories

  validates_presence_of :title, :slug

  scope :for_reports, -> { where(for_reports: true) }
  scope :ordered, -> { order(:position) }
  scope :main, -> { ordered.first }

  def to_s
    "#{title}"
  end
end
