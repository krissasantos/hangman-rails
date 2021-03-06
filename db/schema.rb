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

ActiveRecord::Schema.define(version: 20170222105355) do

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "difficulty"
    t.integer  "maxLength"
    t.string   "word"
    t.string   "blanks_spaces"
  end

  create_table "guesses", force: :cascade do |t|
    t.string  "guess"
    t.integer "game_id"
  end

  create_table "misses", force: :cascade do |t|
    t.string  "miss"
    t.integer "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
    t.integer  "age"
    t.integer  "set_difficulty"
    t.integer  "set_maxLength"
  end

end
