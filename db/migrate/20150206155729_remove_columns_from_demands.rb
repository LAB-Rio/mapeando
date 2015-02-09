class RemoveColumnsFromDemands < ActiveRecord::Migration
  def change
    remove_column :demands, :lat, :string
    remove_column :demands, :long, :string
    remove_column :demands, :transport, :string
  end
end
