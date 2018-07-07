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

ActiveRecord::Schema.define(version: 2018_07_09_021714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "formations", force: :cascade do |t|
    t.string "name", null: false
    t.text "positions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name"
    t.string "number", null: false
    t.string "title"
    t.text "introduction"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "formation_id"
    t.string "name", null: false
    t.string "key", null: false
    t.string "owner_key", null: false
    t.boolean "published"
    t.text "image_cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formation_id"], name: "index_teams_on_formation_id"
    t.index ["key"], name: "index_teams_on_key", unique: true
  end

  add_foreign_key "players", "teams"
  add_foreign_key "teams", "formations"
end
