class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_content
      t.references :user, null: false, foreign_key: true
      t.references :fishlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
