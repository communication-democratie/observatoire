# == Schema Information
#
# Table name: pages
#
#  id         :uuid             not null, primary key
#  markdown   :text
#  position   :integer
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
