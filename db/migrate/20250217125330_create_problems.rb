class CreateProblems < ActiveRecord::Migration[8.0]
  def change
    create_table :problems, id: :uuid do |t|
      t.text :description

      t.timestamps
    end

    add_reference :reports, :problem, foreign_key: true, type: :uuid, null: true
  end
end
