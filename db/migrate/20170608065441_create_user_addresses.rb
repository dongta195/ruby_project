class CreateUserAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_addresses do |t|
      t.references :user, foreign_key: true
      t.string :lastname
      t.string :firstname
      t.string :lastname_kana
      t.string :firstname_kana
      t.string :address
      t.string :building_name
      t.string :telephone
      t.integer :is_default_addr
      t.references :zipcode, foreign_key: true

      t.timestamps
    end
  end
end
