class CreateFishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :fishlists do |t|
      t.date :date
      t.time :time
      t.text :prefecture
      t.string :place
      t.string :map
      t.string :fishname
      t.integer :fishlength
      t.integer :fishweight
      t.string :fishingmethod
      t.string :fishimg

      t.timestamps
    end
  end
end
