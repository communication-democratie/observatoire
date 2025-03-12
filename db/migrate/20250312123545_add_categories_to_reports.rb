class AddCategoriesToReports < ActiveRecord::Migration[8.0]
  def change
    add_column :taxonomies, :for_reports, :boolean, default: false
    create_join_table :categories, :reports, column_options: {type: :uuid}  do |t|
      t.index :category_id
      t.index :report_id
    end
  end
end
