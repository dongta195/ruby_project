class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
