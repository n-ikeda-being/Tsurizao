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

ActiveRecord::Schema[7.0].define(version: 2023_04_18_011356) do
  create_table "areas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishlists", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "prefecture"
    t.string "place"
    t.string "map"
    t.string "fishname"
    t.integer "fishlength"
    t.integer "fishweight"
    t.string "fishingmethod"
    t.string "fishimg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
    t.string "prefecture_name"
  end

  create_table "prefectures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
