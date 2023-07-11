class AddStatusToFishlists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :status, :integer
  end
end
