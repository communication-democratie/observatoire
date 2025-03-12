class AddBrandToReports < ActiveRecord::Migration[8.0]
  def change
    add_column :reports, :brand, :string
  end
end
