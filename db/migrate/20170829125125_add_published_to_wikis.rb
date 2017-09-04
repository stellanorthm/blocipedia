class AddPublishedToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :published, :boolean, default: 0
  end
end
