class AddSlugToProblems < ActiveRecord::Migration[8.1]
  def change
    add_column :problems, :slug, :string

    Problem.reset_column_information
    Problem.find_each do |problem|
      problem.send(:set_slug)
      problem.save!
    end

    change_column_null :problems, :slug, false
    add_index :problems, :slug, unique: true
  end
end
