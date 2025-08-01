class AddSlugToOrganizations < ActiveRecord::Migration[8.0]
  def change
    add_column :organizations, :slug, :string
  end
end
