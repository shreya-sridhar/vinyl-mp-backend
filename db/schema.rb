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

ActiveRecord::Schema.define(version: 2021_02_18_193101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_records", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_records_on_order_id"
    t.index ["record_id"], name: "index_order_records_on_record_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.float "total_sum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.string "cover"
    t.text "songs_list"
    t.integer "year"
    t.float "price"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "genre"
    t.text "description"
  end

  create_table "sell_records", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "user_id"
    t.float "sell_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_sell_records_on_record_id"
    t.index ["user_id"], name: "index_sell_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "friends"
    t.string "favorites"
  end

end
