class CreateReportSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :report_steps, id: :uuid do |t|
      t.string :title
      t.text :description
      t.integer :position, default: 0

      t.timestamps
    end

    add_reference :reports, :step, foreign_key: { to_table: :report_steps }, type: :uuid, null: true
  end
end
