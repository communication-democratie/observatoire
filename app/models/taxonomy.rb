# == Schema Information
#
# Table name: taxonomies
#
#  id          :uuid             not null, primary key
#  description :text
#  position    :integer          default(0)
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Taxonomy < ApplicationRecord

  has_many :categories

  validates_presence_of :title, :slug

  scope :ordered, -> { order(:position) }

  def to_s
    "#{title}"
  end
end
