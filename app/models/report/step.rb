# == Schema Information
#
# Table name: report_steps
#
#  id          :uuid             not null, primary key
#  description :text
#  position    :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Report::Step < ApplicationRecord

  has_many :reports

  scope :ordered, -> { order(:position) }

  def to_s
    "#{title}"
  end
end
