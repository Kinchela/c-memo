class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.date :due_date
      t.string :list
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
