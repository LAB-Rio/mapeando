class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.text :fullname, null: false, default: ''
      t.string :lat, null: false, default: ''
      t.string :long, null: false, default: ''

      t.timestamps null: false

    end
  end
end
