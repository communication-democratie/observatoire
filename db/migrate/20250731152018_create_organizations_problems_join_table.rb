class CreateOrganizationsProblemsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :organizations, :problems, column_options: { type: :uuid } do |t|
      t.index [:problem_id, :organization_id]
    end
  end
end
