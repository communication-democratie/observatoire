# == Schema Information
#
# Table name: report_steps
#
#  id              :uuid             not null, primary key
#  description     :text
#  ignore_in_front :boolean          default(FALSE), not null
#  position        :integer          default(0)
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class Report::StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
