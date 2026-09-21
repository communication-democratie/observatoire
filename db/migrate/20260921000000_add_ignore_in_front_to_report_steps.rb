class AddIgnoreInFrontToReportSteps < ActiveRecord::Migration[8.1]
  def change
    add_column :report_steps, :ignore_in_front, :boolean, default: false, null: false
  end
end
