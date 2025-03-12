class RenameAuthorContactToAuthorEmail < ActiveRecord::Migration[8.0]
  def change
    rename_column :reports, :author_contact, :author_email
    change_column :reports, :author_email, :string
  end
end
