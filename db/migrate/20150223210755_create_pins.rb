class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :lat, null: false, default: ''
      t.string :long, null: false, default: ''
      t.string :fullname, null: false, default: ''
      t.references :demand, index: true

      t.timestamps null: false
    end
    add_index :pins, [:demand_id, :lat, :long], unique: true
    add_foreign_key :pins, :demands
  end
end
