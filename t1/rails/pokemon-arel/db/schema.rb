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

ActiveRecord::Schema.define(version: 2018_07_05_174919) do

  create_table "move_origins", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.integer "generation"
    t.integer "move_id"
  end

  create_table "move_sets", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "move_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "accuracy"
    t.integer "base_power"
    t.integer "move_category_id"
    t.text "description"
    t.text "short_description"
    t.integer "pp"
    t.string "target"
    t.integer "priority"
    t.boolean "secondary"
    t.boolean "is_viable"
    t.integer "type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.float "male_ratio"
    t.float "female_ratio"
    t.float "height"
    t.float "weight"
    t.string "color"
    t.integer "type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
  end

end
