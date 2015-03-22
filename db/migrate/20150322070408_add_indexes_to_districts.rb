class AddIndexesToDistricts < ActiveRecord::Migration
  def change
    add_index :districts, :name, unique: true
  end
end
