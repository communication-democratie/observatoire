# == Schema Information
#
# Table name: problem_steps
#
#  id          :uuid             not null, primary key
#  color       :string           default("#666666")
#  description :text
#  position    :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Problem::Step < ApplicationRecord
  has_many :problems

  scope :ordered, -> { order(:position) }
  scope :analyzed, -> { where('position > 9') }

  def to_s
    "#{title}"
  end
end
