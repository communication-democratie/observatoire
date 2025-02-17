class Report < ApplicationRecord
  scope :ordered, -> { order(created_at: :desc) }

  def to_s
    "#{title}"
  end
end
