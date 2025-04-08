class CreatePages < ActiveRecord::Migration[8.0]
  def change
    create_table :pages, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.text :markdown

      t.timestamps
    end
  end
end
