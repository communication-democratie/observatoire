class Problem < ApplicationRecord
  has_many :reports

  def to_s
    id.split('-').first.upcase
  end
end
