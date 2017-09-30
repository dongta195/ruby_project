class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.references :role, foreign_key: true
      t.text :description
      t.string :company_name
      t.string :company_url
      t.string :company_logo

      t.timestamps
    end
  end
end
