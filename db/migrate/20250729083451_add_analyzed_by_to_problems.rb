class AddAnalyzedByToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :analyzed_by, :string
  end
end
