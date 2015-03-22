class AddIndexesToDemands < ActiveRecord::Migration
  def change
    add_index :demands, :user_id
  end
end
