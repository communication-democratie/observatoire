class AddInternalNoteToReports < ActiveRecord::Migration[8.1]
  def change
    add_column :reports, :internal_note, :text
  end
end
