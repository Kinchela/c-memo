class RemoveColumnsFromChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :date, :date
    remove_column :children, :height, :decimal
    remove_column :children, :weight, :decimal
    remove_column :children, :waist, :decimal
  end
end
