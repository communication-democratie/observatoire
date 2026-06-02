class RemoveYearAndAddReportedAtToProblems < ActiveRecord::Migration[8.1]
  def change
    remove_column :problems, :year
    add_column :problems, :reported_at, :datetime
    Problem.reset_column_information
    Problem.all.each do |problem|
      reported_at = problem.reports.ordered.last&.created_at || problem.created_at
      problem.update_column :reported_at, reported_at
    end
  end
end
