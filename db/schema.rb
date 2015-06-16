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

ActiveRecord::Schema.define(version: 20150615194239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "postgis_topology"
  enable_extension "fuzzystrmatch"
  enable_extension "postgis_tiger_geocoder"

  create_table "addr", primary_key: "gid", force: :cascade do |t|
    t.integer "tlid",      limit: 8
    t.string  "fromhn",    limit: 12
    t.string  "tohn",      limit: 12
    t.string  "side",      limit: 1
    t.string  "zip",       limit: 5
    t.string  "plus4",     limit: 4
    t.string  "fromtyp",   limit: 1
    t.string  "totyp",     limit: 1
    t.integer "fromarmid"
    t.integer "toarmid"
    t.string  "arid",      limit: 22
    t.string  "mtfcc",     limit: 5
    t.string  "statefp",   limit: 2
  end

  add_index "addr", ["tlid", "statefp"], name: "idx_tiger_addr_tlid_statefp", using: :btree
  add_index "addr", ["zip"], name: "idx_tiger_addr_zip", using: :btree

# Could not dump table "addrfeat" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "bg" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "county" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "county_lookup", id: false, force: :cascade do |t|
    t.integer "st_code",            null: false
    t.string  "state",   limit: 2
    t.integer "co_code",            null: false
    t.string  "name",    limit: 90
  end

  add_index "county_lookup", ["state"], name: "county_lookup_state_idx", using: :btree

  create_table "countysub_lookup", id: false, force: :cascade do |t|
    t.integer "st_code",            null: false
    t.string  "state",   limit: 2
    t.integer "co_code",            null: false
    t.string  "county",  limit: 90
    t.integer "cs_code",            null: false
    t.string  "name",    limit: 90
  end

  add_index "countysub_lookup", ["state"], name: "countysub_lookup_state_idx", using: :btree

# Could not dump table "cousub" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "demands", force: :cascade do |t|
    t.text     "fullname",    default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",                  null: false
    t.integer  "category_id",              null: false
  end

  add_index "demands", ["category_id"], name: "index_demands_on_category_id", using: :btree
  add_index "demands", ["user_id"], name: "index_demands_on_user_id", using: :btree

  create_table "direction_lookup", primary_key: "name", force: :cascade do |t|
    t.string "abbrev", limit: 3
  end

  add_index "direction_lookup", ["abbrev"], name: "direction_lookup_abbrev_idx", using: :btree

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

# Could not dump table "edges" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "faces" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "featnames", primary_key: "gid", force: :cascade do |t|
    t.integer "tlid",       limit: 8
    t.string  "fullname",   limit: 100
    t.string  "name",       limit: 100
    t.string  "predirabrv", limit: 15
    t.string  "pretypabrv", limit: 50
    t.string  "prequalabr", limit: 15
    t.string  "sufdirabrv", limit: 15
    t.string  "suftypabrv", limit: 50
    t.string  "sufqualabr", limit: 15
    t.string  "predir",     limit: 2
    t.string  "pretyp",     limit: 3
    t.string  "prequal",    limit: 2
    t.string  "sufdir",     limit: 2
    t.string  "suftyp",     limit: 3
    t.string  "sufqual",    limit: 2
    t.string  "linearid",   limit: 22
    t.string  "mtfcc",      limit: 5
    t.string  "paflag",     limit: 1
    t.string  "statefp",    limit: 2
  end

  add_index "featnames", ["tlid", "statefp"], name: "idx_tiger_featnames_tlid_statefp", using: :btree

  create_table "geocode_settings", primary_key: "name", force: :cascade do |t|
    t.text "setting"
    t.text "unit"
    t.text "category"
    t.text "short_desc"
  end

  create_table "loader_lookuptables", primary_key: "lookup_name", force: :cascade do |t|
    t.integer "process_order",                   default: 1000,  null: false
    t.text    "table_name"
    t.boolean "single_mode",                     default: true,  null: false
    t.boolean "load",                            default: true,  null: false
    t.boolean "level_county",                    default: false, null: false
    t.boolean "level_state",                     default: false, null: false
    t.boolean "level_nation",                    default: false, null: false
    t.text    "post_load_process"
    t.boolean "single_geom_mode",                default: false
    t.string  "insert_mode",           limit: 1, default: "c",   null: false
    t.text    "pre_load_process"
    t.text    "columns_exclude",                                              array: true
    t.text    "website_root_override"
  end

  create_table "loader_platform", primary_key: "os", force: :cascade do |t|
    t.text "declare_sect"
    t.text "pgbin"
    t.text "wget"
    t.text "unzip_command"
    t.text "psql"
    t.text "path_sep"
    t.text "loader"
    t.text "environ_set_command"
    t.text "county_process_command"
  end

  create_table "loader_variables", primary_key: "tiger_year", force: :cascade do |t|
    t.text "website_root"
    t.text "staging_fold"
    t.text "data_schema"
    t.text "staging_schema"
  end

  create_table "pagc_gaz", force: :cascade do |t|
    t.integer "seq"
    t.text    "word"
    t.text    "stdword"
    t.integer "token"
    t.boolean "is_custom", default: true, null: false
  end

  create_table "pagc_lex", force: :cascade do |t|
    t.integer "seq"
    t.text    "word"
    t.text    "stdword"
    t.integer "token"
    t.boolean "is_custom", default: true, null: false
  end

  create_table "pagc_rules", force: :cascade do |t|
    t.text    "rule"
    t.boolean "is_custom", default: true
  end

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

# Could not dump table "place" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "place_lookup", id: false, force: :cascade do |t|
    t.integer "st_code",            null: false
    t.string  "state",   limit: 2
    t.integer "pl_code",            null: false
    t.string  "name",    limit: 90
  end

  add_index "place_lookup", ["state"], name: "place_lookup_state_idx", using: :btree

  create_table "routes", force: :cascade do |t|
    t.text     "fullname",   default: "", null: false
    t.string   "lat",        default: "", null: false
    t.string   "long",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "transport",               null: false
  end

  create_table "secondary_unit_lookup", primary_key: "name", force: :cascade do |t|
    t.string "abbrev", limit: 5
  end

  add_index "secondary_unit_lookup", ["abbrev"], name: "secondary_unit_lookup_abbrev_idx", using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

# Could not dump table "state" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "state_lookup", primary_key: "st_code", force: :cascade do |t|
    t.string "name",    limit: 40
    t.string "abbrev",  limit: 3
    t.string "statefp", limit: 2
  end

  add_index "state_lookup", ["abbrev"], name: "state_lookup_abbrev_key", unique: true, using: :btree
  add_index "state_lookup", ["name"], name: "state_lookup_name_key", unique: true, using: :btree
  add_index "state_lookup", ["statefp"], name: "state_lookup_statefp_key", unique: true, using: :btree

  create_table "street_type_lookup", primary_key: "name", force: :cascade do |t|
    t.string  "abbrev", limit: 50
    t.boolean "is_hw",             default: false, null: false
  end

  add_index "street_type_lookup", ["abbrev"], name: "street_type_lookup_abbrev_idx", using: :btree

# Could not dump table "tabblock" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "tract" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "zcta5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "zip_lookup", primary_key: "zip", force: :cascade do |t|
    t.integer "st_code"
    t.string  "state",   limit: 2
    t.integer "co_code"
    t.string  "county",  limit: 90
    t.integer "cs_code"
    t.string  "cousub",  limit: 90
    t.integer "pl_code"
    t.string  "place",   limit: 90
    t.integer "cnt"
  end

  create_table "zip_lookup_all", id: false, force: :cascade do |t|
    t.integer "zip"
    t.integer "st_code"
    t.string  "state",   limit: 2
    t.integer "co_code"
    t.string  "county",  limit: 90
    t.integer "cs_code"
    t.string  "cousub",  limit: 90
    t.integer "pl_code"
    t.string  "place",   limit: 90
    t.integer "cnt"
  end

  create_table "zip_lookup_base", primary_key: "zip", force: :cascade do |t|
    t.string "state",   limit: 40
    t.string "county",  limit: 90
    t.string "city",    limit: 90
    t.string "statefp", limit: 2
  end

  create_table "zip_state", id: false, force: :cascade do |t|
    t.string "zip",     limit: 5, null: false
    t.string "stusps",  limit: 2, null: false
    t.string "statefp", limit: 2
  end

  create_table "zip_state_loc", id: false, force: :cascade do |t|
    t.string "zip",     limit: 5,   null: false
    t.string "stusps",  limit: 2,   null: false
    t.string "statefp", limit: 2
    t.string "place",   limit: 100, null: false
  end

  add_foreign_key "pins", "demands"
end
