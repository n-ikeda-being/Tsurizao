class AddUserNameToFishlists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :user_name, :string
  end
end
