# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150210144525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "travel_mode",                 null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "issue",       default: false, null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["travel_mode"], name: "index_categories_on_travel_mode", using: :btree

  create_table "demands", force: :cascade do |t|
    t.text     "fullname",    default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",                  null: false
    t.integer  "category_id",              null: false
  end

  add_index "demands", ["category_id"], name: "index_demands_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",       default: "", null: false
    t.string   "last_name",        default: "", null: false
    t.string   "address_district", default: "", null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "email",                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
