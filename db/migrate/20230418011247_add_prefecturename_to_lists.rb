class AddPrefecturenameToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :prefecture_name, :string
  end
end
