class RemoveZipcodeIdAndAddZipcodeToUserAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_addresses, :zipcode, foreign_key: true
    add_column :user_addresses, :zipcode, :string
  end
end
