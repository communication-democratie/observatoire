# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  analyzed_by :string
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
require "test_helper"

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
