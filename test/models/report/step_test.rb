# == Schema Information
#
# Table name: report_steps
#
#  id                         :uuid             not null, primary key
#  description                :text
#  email_notification_active  :boolean          default(FALSE)
#  email_notification_subject :string
#  email_notification_text    :text
#  ignore_in_front            :boolean          default(FALSE), not null
#  position                   :integer          not null
#  title                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  parent_id                  :uuid
#
# Indexes
#
#  index_report_steps_on_parent_id                (parent_id)
#  index_report_steps_on_parent_id_and_position   (parent_id,position) UNIQUE WHERE (parent_id IS NOT NULL)
#  index_report_steps_on_position_without_parent  (position) UNIQUE WHERE (parent_id IS NULL)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => report_steps.id)
#
require "test_helper"

class Report::StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
