class ChangeMemoType < ActiveRecord::Migration[5.1]
  def change
    change_column :exhibitions, :memo, :text
    change_column :orders, :memo, :text
  end
end
