class AddBooleansToProblemStep < ActiveRecord::Migration[8.0]
  def change
    add_column :problem_steps, :importance, :integer, default: 0
  end
end
