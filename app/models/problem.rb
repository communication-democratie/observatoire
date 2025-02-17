# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Problem < ApplicationRecord
  has_many :reports
  has_and_belongs_to_many :categories

  scope :ordered, -> { order(created_at: :desc) }

  def to_s
    id.split('-').first.upcase
  end
end
