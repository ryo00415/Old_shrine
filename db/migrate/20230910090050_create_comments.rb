class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      #カラム
      t.string :caption, null: false
      t.integer :photo_id
      t.integer :user_id
      t.timestamps
    end
  end
end
