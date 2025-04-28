class AddYearToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :year, :integer
  end
end
