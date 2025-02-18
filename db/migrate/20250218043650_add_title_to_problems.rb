class AddTitleToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :title, :string
  end
end
