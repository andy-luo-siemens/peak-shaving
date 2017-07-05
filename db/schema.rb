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

ActiveRecord::Schema.define(version: 20170705143451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evse_gateways", force: :cascade do |t|
    t.macaddr "mac_address"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topology_id"
    t.index ["topology_id"], name: "index_evse_gateways_on_topology_id"
  end

  create_table "evses", force: :cascade do |t|
    t.inet "ip_address"
    t.string "name"
    t.bigint "evse_gateway_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evse_gateway_id"], name: "index_evses_on_evse_gateway_id"
  end

  create_table "meters", force: :cascade do |t|
    t.integer "address"
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sem3_controller_id"
    t.index ["sem3_controller_id"], name: "index_meters_on_sem3_controller_id"
  end

  create_table "peak_shaving_plans", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "topology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topology_id"], name: "index_peak_shaving_plans_on_topology_id"
    t.index ["user_id"], name: "index_peak_shaving_plans_on_user_id"
  end

  create_table "sem3_controllers", force: :cascade do |t|
    t.inet "ip_address"
    t.string "name"
    t.bigint "sem3_gateway_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sem3_gateway_id"], name: "index_sem3_controllers_on_sem3_gateway_id"
  end

  create_table "sem3_gateways", force: :cascade do |t|
    t.macaddr "mac_address"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topology_id"
    t.index ["topology_id"], name: "index_sem3_gateways_on_topology_id"
  end

  create_table "topologies", force: :cascade do |t|
    t.string "name"
    t.float "limit_threshold_kilowatt"
    t.float "warning_threshold_kilowatt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "evse_gateways", "topologies"
  add_foreign_key "evses", "evse_gateways"
  add_foreign_key "meters", "sem3_controllers"
  add_foreign_key "peak_shaving_plans", "topologies"
  add_foreign_key "peak_shaving_plans", "users"
  add_foreign_key "sem3_controllers", "sem3_gateways"
  add_foreign_key "sem3_gateways", "topologies"
end
