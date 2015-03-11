class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.string :lat
      t.string :long

      t.timestamps null: false
    end
  end
end
