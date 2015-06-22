class AddGeometryFieldsToDistricts < ActiveRecord::Migration
  def change
    add_column :districts, :shape_area, :float, null: false, default: 0.0
    add_column :districts, :shape_length, :float, null: false, default: 0.0
    add_column :districts, :geo, :geometry 

  end
end
