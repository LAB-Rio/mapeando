class RenameStreetTableToRoutes < ActiveRecord::Migration
  def change
    rename_table :streets, :routes
  end
end
