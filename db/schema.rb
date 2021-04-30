# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_29_235443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blob_monsters", force: :cascade do |t|
    t.string "name"
    t.string "catch_phrase"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_health"
    t.integer "attack"
    t.integer "defense"
    t.integer "room_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "current_room"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loot_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loot_inventory", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loot_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loot_stashes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loots", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_dead"
    t.integer "base_health"
    t.string "catch_phrase"
    t.boolean "has_loot"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game_id"
    t.integer "monster_id"
    t.boolean "has_monster"
    t.boolean "has_escaped"
    t.boolean "has_loot"
    t.integer "loot_id"
  end

  create_table "user_inventories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loot_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game_id"
    t.integer "base_health"
    t.string "character_class"
    t.integer "base_attack"
  end

end
