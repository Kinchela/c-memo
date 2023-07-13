class AddColumnToCharts < ActiveRecord::Migration[7.0]
  def change
    add_reference :charts, :user, null: false, foreign_key: true
  end
end
