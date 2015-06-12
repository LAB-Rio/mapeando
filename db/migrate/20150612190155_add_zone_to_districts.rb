class AddZoneToDistricts < ActiveRecord::Migration
  def change
    add_column :districts, :zone, :string, null: false, default: ''
    add_index :districts, :zone
  end
end
