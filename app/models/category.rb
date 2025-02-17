# == Schema Information
#
# Table name: categories
#
#  id          :uuid             not null, primary key
#  description :text
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  taxonomy_id :uuid             not null
#
# Indexes
#
#  index_categories_on_taxonomy_id  (taxonomy_id)
#
# Foreign Keys
#
#  fk_rails_...  (taxonomy_id => taxonomies.id)
#
class Category < ApplicationRecord
  belongs_to :taxonomy

  validates_presence_of :title, :slug
  
  def to_s
    "#{title}"
  end
end
