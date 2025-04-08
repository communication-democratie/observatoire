class AddPositionToPages < ActiveRecord::Migration[8.0]
  def change
    add_column :pages, :position, :integer
  end
end
