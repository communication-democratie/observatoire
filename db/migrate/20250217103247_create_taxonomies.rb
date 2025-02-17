class CreateTaxonomies < ActiveRecord::Migration[8.0]
  def change
    create_table :taxonomies, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
