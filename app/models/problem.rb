# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  description :text
#  reported_at :datetime
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
  has_and_belongs_to_many :organizations

  has_one_attached_deletable :image
  has_one_attached_deletable :pdf

  validates_presence_of :title

  after_save :set_reported_at
  after_touch :set_reported_at

  scope :ordered, -> { order(reported_at: :desc) }
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

  def emails
    @emails ||= reports.ordered.pluck(:author_email).uniq.compact_blank
  end

  # First is last :)
  # this is because the order is desc
  def first_report
    @first_report ||= reports.ordered.last
  end

  def to_s
    "#{title}"
  end

  protected

  def set_reported_at
    date = first_report&.created_at || date = created_at
    update_column :reported_at, date
  end
end
