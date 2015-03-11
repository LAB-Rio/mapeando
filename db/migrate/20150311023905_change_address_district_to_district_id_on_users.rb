class ChangeAddressDistrictToDistrictIdOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :address_district
    add_column :users, :district_id, :integer, default: 0, null: false


    add_index :users, :district_id
  end
end
