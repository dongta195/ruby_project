class RemovePriceAndAddReferenceBrandIdToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :original_price, :integer
    add_reference :products, :brand_user, index: true,
      foreign_key: {to_table: :users}
  end
end
