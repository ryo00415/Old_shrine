class AddIsDeletedTousers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_deleted, :boolean, default: false unless column_exists?(:users, :is_deleted)
  end
end
