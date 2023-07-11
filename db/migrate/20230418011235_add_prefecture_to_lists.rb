class AddPrefectureToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :fishlists, :prefecture_id, :integer
  end
end
