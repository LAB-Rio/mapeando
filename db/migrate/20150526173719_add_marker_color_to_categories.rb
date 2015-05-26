class AddMarkerColorToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :marker_color, :string, null: false, default: '#ed2654'
  end
end
