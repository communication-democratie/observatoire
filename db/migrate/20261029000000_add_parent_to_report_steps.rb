class AddParentToReportSteps < ActiveRecord::Migration[8.1]
  def change
    add_reference :report_steps, :parent,
                  foreign_key: { to_table: :report_steps },
                  type: :uuid

    change_column_default :report_steps, :position, from: 0, to: nil
    change_column_null :report_steps, :position, false

    add_index :report_steps, [:parent_id, :position],
              unique: true,
              where: 'parent_id IS NOT NULL',
              name: 'index_report_steps_on_parent_id_and_position'
    add_index :report_steps, :position,
              unique: true,
              where: 'parent_id IS NULL',
              name: 'index_report_steps_on_position_without_parent'
  end
end
