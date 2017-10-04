class AddWikiProperties < ActiveRecord::Migration
  def change
    add_column :collaborators, :user_id, :integer
    add_column :collaborators, :email, :string
  end
end
