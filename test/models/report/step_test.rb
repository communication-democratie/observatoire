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
require "test_helper"

class Report::StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
