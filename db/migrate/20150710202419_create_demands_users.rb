class CreateDemandsUsers < ActiveRecord::Migration
  def change
    create_table :demands_users do |t|
      t.integer :demand_id, null: false
      t.integer :user_id, null: false
    end


    add_index :demands_users, [:demand_id, :user_id], unique: true
  end
end
