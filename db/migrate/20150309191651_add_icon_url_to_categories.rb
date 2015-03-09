class AddIconUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :icon_url, :string
  end
end
