class ChangeUsersColumns < ActiveRecord::Migration
  def change
    change_column :users, :first_name, :string, null: false, default: ''
    change_column :users, :last_name, :string, null: false, default: ''
    change_column :users, :address_district, :string, null: false, default: ''
  end
end
