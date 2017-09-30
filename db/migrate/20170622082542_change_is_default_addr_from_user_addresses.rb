class ChangeIsDefaultAddrFromUserAddresses < ActiveRecord::Migration[5.1]
  def change
    change_column :user_addresses, :is_default_addr, :boolean, default: false
  end
end
