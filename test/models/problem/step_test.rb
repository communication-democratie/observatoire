# == Schema Information
#
# Table name: problem_steps
#
#  id          :uuid             not null, primary key
#  color       :string           default("#666666")
#  description :text
#  importance  :integer          default("medium")
#  position    :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class Problem::StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
