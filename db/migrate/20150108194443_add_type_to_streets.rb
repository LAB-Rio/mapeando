class AddTypeToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :type, :string, null: false
  end
end
