class CreateTimelines < ActiveRecord::Migration[6.1]
  def change
    create_table :timelines do |t|
      #カラム
      t.text :content, null: false
      t.string :liked_count, null: false

      t.timestamps
    end
  end
end
