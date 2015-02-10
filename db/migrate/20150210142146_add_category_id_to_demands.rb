class AddCategoryIdToDemands < ActiveRecord::Migration
  def change
    add_column :demands, :category_id, :integer, null: false

    add_index :demands, :category_id
  end
end
