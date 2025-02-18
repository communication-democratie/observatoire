# == Schema Information
#
# Table name: problems
#
#  id          :uuid             not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
