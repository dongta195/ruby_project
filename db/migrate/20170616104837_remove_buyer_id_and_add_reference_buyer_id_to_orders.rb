class RemoveBuyerIdAndAddReferenceBuyerIdToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :buyer_user_id, :integer
    remove_column :orders, :billing_user_address_id, :integer
    remove_column :orders, :shipping_user_address_id, :integer

    add_reference :orders, :buyer_user, index: true,
      foreign_key: {to_table: :users}
    add_reference :orders, :billing_user_address, index: true,
      foreign_key: {to_table: :user_addresses}
    add_reference :orders, :shipping_user_address, index: true,
      foreign_key: {to_table: :user_addresses}
  end
end
