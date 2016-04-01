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

ActiveRecord::Schema.define(version: 20160401133101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combats", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.integer  "min_rank"
    t.integer  "start_age"
    t.integer  "end_age"
    t.integer  "start_weight"
    t.integer  "end_weight"
    t.boolean  "team"
    t.string   "sex"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "combats", ["event_id"], name: "index_combats_on_event_id", using: :btree

  create_table "combats_people", force: :cascade do |t|
    t.integer "person_id"
    t.integer "combat_id"
  end

  add_index "combats_people", ["combat_id"], name: "index_combats_people_on_combat_id", using: :btree
  add_index "combats_people", ["person_id"], name: "index_combats_people_on_person_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "details"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.json     "team_structure", default: {}
  end

  create_table "people", force: :cascade do |t|
    t.integer  "registrator_id"
    t.string   "first_name",     default: "", null: false
    t.string   "middle_name",    default: "", null: false
    t.string   "last_name",      default: "", null: false
    t.date     "birthday",                    null: false
    t.string   "sex",            default: "", null: false
    t.string   "kind",           default: "", null: false
    t.string   "kind_data"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "people", ["registrator_id"], name: "index_people_on_registrator_id", using: :btree

  create_table "people_registers", force: :cascade do |t|
    t.integer "person_id"
    t.integer "register_id"
  end

  add_index "people_registers", ["person_id"], name: "index_people_registers_on_person_id", using: :btree
  add_index "people_registers", ["register_id"], name: "index_people_registers_on_register_id", using: :btree

  create_table "registers", force: :cascade do |t|
    t.integer  "registrator_id"
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "registers", ["event_id"], name: "index_registers_on_event_id", using: :btree
  add_index "registers", ["registrator_id"], name: "index_registers_on_registrator_id", using: :btree

  create_table "registrators", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 0,  null: false
    t.string   "first_name",             default: "", null: false
    t.string   "middle_name",            default: "", null: false
    t.string   "last_name",              default: "", null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "registrators", ["confirmation_token"], name: "index_registrators_on_confirmation_token", unique: true, using: :btree
  add_index "registrators", ["email"], name: "index_registrators_on_email", unique: true, using: :btree
  add_index "registrators", ["reset_password_token"], name: "index_registrators_on_reset_password_token", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "number"
    t.integer  "combat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["combat_id"], name: "index_teams_on_combat_id", using: :btree

  add_foreign_key "combats", "events"
  add_foreign_key "people", "registrators"
  add_foreign_key "registers", "events"
  add_foreign_key "registers", "registrators"
  add_foreign_key "teams", "combats"
end
