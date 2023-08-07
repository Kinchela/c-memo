class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date :date
      t.decimal :height, precision: 4, scale: 1
      t.decimal :weight, precision: 5, scale: 2
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
