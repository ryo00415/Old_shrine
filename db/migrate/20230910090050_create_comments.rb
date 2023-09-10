class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      #カラム
      t.string :caption, null: false
      
      t.timestamps
    end
  end
end
