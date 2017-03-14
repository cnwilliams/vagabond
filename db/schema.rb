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

ActiveRecord::Schema.define(version: 20170314152526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_column_to_users", force: :cascade do |t|
    t.string   "profile_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id"], name: "index_user_tips_on_tip_id", using: :btree
    t.index ["user_id"], name: "index_user_tips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "current_city"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "profile_image"
  end

  add_foreign_key "user_tips", "tips"
  add_foreign_key "user_tips", "users"
end