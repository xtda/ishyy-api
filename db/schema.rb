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

ActiveRecord::Schema.define(version: 2018_08_07_072622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "auditlogs", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "method"
    t.text "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ref"
  end

  create_table "jobdetails", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "tempjob_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_jobdetails_on_player_id"
    t.index ["tempjob_id"], name: "index_jobdetails_on_tempjob_id"
  end

  create_table "mayors", force: :cascade do |t|
    t.string "current_mayor", default: "xtda616"
    t.bigint "current_funds", default: 250000
    t.integer "current_tax", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mayor_vote"
    t.datetime "mayor_last_voted", default: "2018-08-03 11:16:23"
    t.datetime "temp_job_last_claimed", default: "2018-08-04 07:25:50"
  end

  create_table "tempjobresponses", force: :cascade do |t|
    t.string "response_sign"
    t.string "response_type"
    t.text "response"
    t.bigint "tempjob_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tempjob_id"], name: "index_tempjobresponses_on_tempjob_id"
  end

  create_table "tempjobs", force: :cascade do |t|
    t.string "type"
    t.string "code"
    t.string "title"
    t.integer "base_pay"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mayor_bonus", default: 0
    t.index ["code"], name: "index_tempjobs_on_code", unique: true
  end

  add_foreign_key "jobdetails", "players"
  add_foreign_key "jobdetails", "tempjobs"
  add_foreign_key "tempjobresponses", "tempjobs"
end
