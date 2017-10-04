class RemoveUserEmail < ActiveRecord::Migration
  def change
    remove_column :collaborators, :user_email, :string
  end
end
