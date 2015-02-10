class RenameTransportToTravelModeOnCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :transport, :travel_mode
    

    add_index :categories, :travel_mode
  end
end
