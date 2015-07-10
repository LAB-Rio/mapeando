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

ActiveRecord::Schema.define(version: 20150710202419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name",      default: "",    null: false
    t.string   "last_name",       default: "",    null: false
    t.string   "role",                            null: false
    t.string   "email",                           null: false
    t.boolean  "status",          default: false
    t.string   "token",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "travel_mode",                      null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "issue",        default: false,     null: false
    t.string   "icon_url"
    t.string   "marker_color", default: "#ed2654", null: false
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
  add_index "demands", ["user_id"], name: "index_demands_on_user_id", using: :btree



  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "zone",       default: "", null: false
  end

  add_index "districts", ["name"], name: "index_districts_on_name", unique: true, using: :btree
  add_index "districts", ["zone"], name: "index_districts_on_zone", using: :btree


  create_table "demands_users", force: :cascade do |t|
    t.integer "demand_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "demands_users", ["demand_id", "user_id"], name: "index_demands_users_on_demand_id_and_user_id", unique: true, using: :btree

  create_table "pins", force: :cascade do |t|
    t.string   "lat",        default: "", null: false
    t.string   "long",       default: "", null: false
    t.string   "fullname",   default: "", null: false
    t.integer  "demand_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "pins", ["demand_id", "lat", "long"], name: "index_pins_on_demand_id_and_lat_and_long", unique: true, using: :btree
  add_index "pins", ["demand_id"], name: "index_pins_on_demand_id", using: :btree




  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                               null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "provider",               default: "", null: false
    t.string   "uid",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar",                 default: "", null: false
    t.integer  "district_id",            default: 0,  null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["district_id"], name: "index_users_on_district_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree


  add_foreign_key "pins", "demands"
end
