class AddDeviseForAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :encrypted_password, :string, null: false, default: ""
    add_column :admins, :reset_password_token, :string
    add_column :admins, :reset_password_sent_at, :datetime
    add_column :admins, :remember_created_at, :datetime
    add_column :admins, :sign_in_count, :integer, default: 0, null: false
    add_column :admins, :current_sign_in_at, :datetime
    add_column :admins, :last_sign_in_at, :datetime
    add_column :admins, :current_sign_in_ip, :string
    add_column :admins, :last_sign_in_ip, :string
    add_index :admins, :username, unique: true
    add_index :admins, :reset_password_token, unique: true
  end
end
