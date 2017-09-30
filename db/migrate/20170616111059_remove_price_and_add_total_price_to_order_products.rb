class RemovePriceAndAddTotalPriceToOrderProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_products, :price, :integer

    add_column :order_products, :total_price, :integer
    add_column :order_products, :total_original_price, :integer
  end
end
