class RemoveBrandIdAndAddRefBrandIdToExhibitions < ActiveRecord::Migration[5.1]
  def change
    remove_column :exhibitions, :brand_user_id, :integer
    add_reference :exhibitions, :brand_user, index: true,
      foreign_key: {to_table: :users}
  end
end
