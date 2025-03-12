# == Schema Information
#
# Table name: reports
#
#  id               :uuid             not null, primary key
#  author_contact   :text
#  author_pseudonym :string
#  description      :text
#  link             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  problem_id       :uuid
#  step_id          :uuid
#
# Indexes
#
#  index_reports_on_problem_id  (problem_id)
#  index_reports_on_step_id     (step_id)
#
# Foreign Keys
#
#  fk_rails_...  (problem_id => problems.id)
#  fk_rails_...  (step_id => report_steps.id)
#
class Report < ApplicationRecord
  include WithSteps

  belongs_to :problem, optional: true

  scope :ordered, -> { order(created_at: :desc) }

  has_one_attached :image

  def to_s
    title.blank? ? "#{id}" : "#{title}"
  end
end
