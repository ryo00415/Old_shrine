class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      #カラム
      t.integer :user_id
      t.string :title, null: false
      t.string :caption, null: false

      t.timestamps
    end
  end
end
