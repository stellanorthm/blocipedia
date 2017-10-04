class AddWikiProperty < ActiveRecord::Migration
  def change
    add_column :collaborators, :user_email, :string
    remove_column :collaborators, :email, :string
  end
end
