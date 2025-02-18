# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Problem < ApplicationRecord
  has_many :reports
  has_and_belongs_to_many :categories

  has_one_attached :image

  scope :ordered, -> { order(created_at: :desc) }

  def identifier
    id.split('-').first.upcase
  end

  def to_s
    "#{title}"
  end
end
