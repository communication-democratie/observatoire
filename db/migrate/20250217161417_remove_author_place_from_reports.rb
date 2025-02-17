class RemoveAuthorPlaceFromReports < ActiveRecord::Migration[8.0]
  def change
    remove_column :reports, :author_place
  end
end
