class AddColumsTofishlists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :weather, :string
    add_column :fishlists, :quantity, :integer
    add_column :fishlists, :message, :string
  end
end
