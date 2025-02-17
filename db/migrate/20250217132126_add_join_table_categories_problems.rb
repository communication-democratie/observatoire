class AddJoinTableCategoriesProblems < ActiveRecord::Migration[8.0]
  def change
    create_join_table :categories, :problems, column_options: {type: :uuid}  do |t|
      t.index :problem_id
      t.index :category_id
    end
  end
end
