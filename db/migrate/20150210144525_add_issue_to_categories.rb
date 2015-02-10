class AddIssueToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :issue, :boolean, default: false, null: false
  end
end
