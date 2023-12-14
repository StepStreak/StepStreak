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

ActiveRecord::Schema[7.1].define(version: 2023_12_14_204212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "steps", default: 0
    t.float "calories", default: 0.0
    t.float "distance", default: 0.0
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "heart_rate", default: 0.0
    t.float "resting_heart_rate", default: 0.0
    t.float "max_heart_rate", default: 0.0
    t.bigint "user_id"
    t.index ["date", "user_id"], name: "index_activities_on_date_and_user_id", unique: true
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "challenge_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_users_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_users_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.integer "challenge_type", default: 0
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "locked", default: false
    t.string "code"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "activities", "users", validate: false
  add_foreign_key "challenge_users", "challenges"
  add_foreign_key "challenge_users", "users"
end
