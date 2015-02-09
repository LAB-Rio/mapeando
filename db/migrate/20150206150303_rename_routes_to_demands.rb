class RenameRoutesToDemands < ActiveRecord::Migration
  def change
    rename_table :routes, :demands
  end
end
