class RemoveColumnFromMicroposts < ActiveRecord::Migration[7.0]
  def change
    remove_column :microposts, :shareable_link, :string
    remove_column :microposts, :expiration_date, :datetime
  end
end
