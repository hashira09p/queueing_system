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

ActiveRecord::Schema[7.0].define(version: 2024_10_04_061543) do
  create_table "available_transactions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", charset: "utf8mb4", force: :cascade do |t|
    t.integer "ticket_number"
    t.bigint "work_station_id"
    t.datetime "finished_at"
    t.datetime "active_at"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "available_transaction_id", null: false
    t.string "other"
    t.index ["work_station_id"], name: "index_tickets_on_work_station_id"
  end

  create_table "work_station_transactions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "work_station_id"
    t.bigint "available_transaction_id"
    t.index ["available_transaction_id"], name: "index_work_station_transactions_on_available_transaction_id"
    t.index ["work_station_id"], name: "index_work_station_transactions_on_work_station_id"
  end

  create_table "work_stations", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
