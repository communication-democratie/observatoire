# == Schema Information
#
# Table name: taxonomies
#
#  id          :uuid             not null, primary key
#  description :text
#  position    :integer          default(0)
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class TaxonomyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
