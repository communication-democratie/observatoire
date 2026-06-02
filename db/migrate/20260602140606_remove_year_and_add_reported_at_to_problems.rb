class RemoveYearAndAddReportedAtToProblems < ActiveRecord::Migration[8.1]
  def change
    remove_column :problems, :year
    add_column :problems, :reported_at, :datetime
  end
end
