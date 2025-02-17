class Report < ApplicationRecord
  def to_s
    "#{title}"
  end
end
