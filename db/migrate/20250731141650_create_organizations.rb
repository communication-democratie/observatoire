class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations, id: :uuid do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.string :website
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
