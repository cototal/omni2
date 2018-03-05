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

ActiveRecord::Schema.define(version: 20180305015907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowance_entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "entry_date", null: false
    t.decimal "price", precision: 12, scale: 2, null: false
    t.string "payee"
    t.string "category"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_allowance_entries_on_user_id"
  end

  create_table "allowance_tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "goal", null: false
    t.string "reward", null: false
    t.integer "days", default: [], array: true
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_allowance_tasks_on_user_id"
  end

  create_table "notes_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_entries", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "body"
    t.bigint "notes_category_id"
    t.bigint "user_id", null: false
    t.bigint "notes_sequence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notes_category_id"], name: "index_notes_entries_on_notes_category_id"
    t.index ["notes_sequence_id"], name: "index_notes_entries_on_notes_sequence_id"
    t.index ["user_id"], name: "index_notes_entries_on_user_id"
  end

  create_table "notes_sequences", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "notes_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notes_category_id"], name: "index_notes_sequences_on_notes_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "start"
    t.integer "duration"
    t.string "exercise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.index ["user_id"], name: "index_workouts_sessions_on_user_id"
  end

  create_table "workouts_seven_mins", force: :cascade do |t|
    t.string "exercise", null: false
    t.text "description"
    t.integer "position"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allowance_entries", "users"
  add_foreign_key "allowance_tasks", "users"
  add_foreign_key "notes_entries", "notes_categories"
  add_foreign_key "notes_entries", "notes_sequences"
  add_foreign_key "notes_entries", "users"
  add_foreign_key "notes_sequences", "notes_categories"
  add_foreign_key "workouts_sessions", "users"
end
