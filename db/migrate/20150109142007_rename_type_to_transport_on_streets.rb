class RenameTypeToTransportOnStreets < ActiveRecord::Migration
  def change
    rename_column :streets, :type, :transport
  end
end
