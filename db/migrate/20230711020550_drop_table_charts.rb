class DropTableCharts < ActiveRecord::Migration[7.0]
  def change
    drop_table :charts do |t|
      t.string :name
      t.date :date
      t.decimal :height, precision: 4, scale: 1
      t.decimal :weight, precision: 5, scale: 2
      t.decimal :waist, precision: 4, scale: 1
      t.bigint :user_id

      t.timestamps
    end
  end
end
