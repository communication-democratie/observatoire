# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  description :text
#  title       :string
#  year        :integer
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
  has_and_belongs_to_many :organizations

  has_one_attached :image

  validates_presence_of :year

  scope :ordered, -> { order(year: :desc) }
  scope :normal_and_important, -> { joins(:step).where('problem_steps.importance >= 0') }
  scope :important, -> { joins(:step).where('problem_steps.importance > 0') }
  scope :for_home, -> { important.ordered.limit(4) }

  def identifier
    id.split('-').first.upcase
  end

  def main_categories
    categories.where(id: Taxonomy.main.categories)
  end

  def important?
    step.importance == 'high'
  end

  def reported_by
    @reported_by ||= reports.pluck(:author_pseudonym)
                            .uniq
                            .compact_blank
                            .sort
  end


  def description_to_html
    MarkdownRenderer.new(description).html
  end

  def to_s
    "#{title}"
  end
end
