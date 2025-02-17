class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.references :taxonomy, null: false, foreign_key: true, type: :uuid
      t.text :description

      t.timestamps
    end
  end
end
