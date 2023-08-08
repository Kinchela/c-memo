class AddNameIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name_id, :string
    add_index :users, :name_id, unique: true
  end
end
