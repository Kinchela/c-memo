class AddColumnsToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :shareable_link, :string
    add_column :microposts, :expiration_date, :datetime
  end
end
