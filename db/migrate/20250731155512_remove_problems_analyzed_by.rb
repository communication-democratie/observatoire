class RemoveProblemsAnalyzedBy < ActiveRecord::Migration[8.0]
  def change
    remove_column :problems, :analyzed_by
  end
end
