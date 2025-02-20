# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  step_id     :uuid
#
# Indexes
#
#  index_problems_on_step_id  (step_id)
#
# Foreign Keys
#
#  fk_rails_...  (step_id => problem_steps.id)
#
class Problem < ApplicationRecord
  include WithSteps

  has_many :reports
  has_and_belongs_to_many :categories

  has_one_attached :image

  scope :ordered, -> { order(created_at: :desc) }

  def identifier
    id.split('-').first.upcase
  end

  def main_categories
    categories.where(id: Taxonomy.main.categories)
  end

  def to_s
    "#{title}"
  end
end
