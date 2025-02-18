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
#
# Indexes
#
#  index_reports_on_problem_id  (problem_id)
#
# Foreign Keys
#
#  fk_rails_...  (problem_id => problems.id)
#
class Report < ApplicationRecord
  belongs_to :problem, optional: true

  scope :ordered, -> { order(created_at: :desc) }

  has_one_attached :image

  def to_s
    "#{title}"
  end
end
