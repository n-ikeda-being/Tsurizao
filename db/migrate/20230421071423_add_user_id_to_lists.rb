class AddUserIdToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :user_id, :integer
  end
end
