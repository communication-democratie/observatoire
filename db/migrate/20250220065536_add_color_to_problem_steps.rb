class AddColorToProblemSteps < ActiveRecord::Migration[8.0]
  def change
    add_column :problem_steps, :color, :string, default: '#666666'
  end
end
