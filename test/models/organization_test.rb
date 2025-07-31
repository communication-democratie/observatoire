# == Schema Information
#
# Table name: organizations
#
#  id          :uuid             not null, primary key
#  description :text
#  level       :integer          default("member")
#  name        :string
#  short_name  :string
#  slug        :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
