class AddStoreToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :store, :string
  end
end
