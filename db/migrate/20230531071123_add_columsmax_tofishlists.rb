class AddColumsmaxTofishlists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :maxtime, :time
    add_column :fishlists, :maxfishlength, :integer
    add_column :fishlists, :maxfishweight, :integer
  end
end
