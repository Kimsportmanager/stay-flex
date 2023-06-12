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

ActiveRecord::Schema[7.0].define(version: 2023_06_08_173406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "rooms_id", null: false
    t.float "fees"
    t.date "check_in_date"
    t.date "check_out_date"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rooms_id"], name: "index_reservations_on_rooms_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "reservations_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservations_id"], name: "index_reviews_on_reservations_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "city"
    t.text "neighborhood"
    t.integer "room_number"
    t.integer "bathroom_number"
    t.integer "bed_number"
    t.integer "max_ccupants"
    t.integer "price"
    t.string "room_pictures"
    t.date "available_start_date"
    t.date "available_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["users_id"], name: "index_rooms_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first"
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "profile_picture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservations", "rooms", column: "rooms_id"
  add_foreign_key "reservations", "users", column: "users_id"
  add_foreign_key "reviews", "reservations", column: "reservations_id"
  add_foreign_key "rooms", "users", column: "users_id"
end
