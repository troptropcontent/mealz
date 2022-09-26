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

ActiveRecord::Schema[7.0].define(version: 2022_09_19_195654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "brigades", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_brigades_on_event_id"
  end

  create_table "chefs", force: :cascade do |t|
    t.bigint "brigade_id", null: false
    t.bigint "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brigade_id"], name: "index_chefs_on_brigade_id"
    t.index ["guest_id"], name: "index_chefs_on_guest_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.text "description"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_courses_on_meal_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "start_on"
    t.date "end_on"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false, null: false
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "nickname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_guests_on_event_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.date "scheduled_on", null: false
    t.integer "kind", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brigade_id"
    t.index ["brigade_id"], name: "index_meals_on_brigade_id"
    t.index ["event_id"], name: "index_meals_on_event_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.float "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_recipes_on_course_id"
    t.index ["ingredient_id"], name: "index_recipes_on_ingredient_id"
  end

  add_foreign_key "brigades", "events"
  add_foreign_key "chefs", "brigades"
  add_foreign_key "chefs", "guests"
  add_foreign_key "courses", "meals"
  add_foreign_key "guests", "events"
  add_foreign_key "meals", "brigades"
  add_foreign_key "meals", "events"
  add_foreign_key "recipes", "courses"
  add_foreign_key "recipes", "ingredients"
end
