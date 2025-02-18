class AddLinkToReport < ActiveRecord::Migration[8.0]
  def change
    add_column :reports, :link, :string
  end
end
