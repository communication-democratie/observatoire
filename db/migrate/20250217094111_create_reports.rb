class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :author_pseudonym
      t.string :author_place
      t.text :author_contact

      t.timestamps
    end
  end
end
