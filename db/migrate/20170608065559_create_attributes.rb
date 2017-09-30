class CreateAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :attributes do |t|
      t.string :attr_name

      t.timestamps
    end
  end
end
