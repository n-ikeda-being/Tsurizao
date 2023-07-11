class ChangeColumntofishlists < ActiveRecord::Migration[7.0]
  def change
    change_column_default :fishlists, :status, from: nil, to: "0"
  end
end
