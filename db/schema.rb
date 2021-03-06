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

ActiveRecord::Schema.define(version: 2020_12_23_002927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobnumbers", force: :cascade do |t|
    t.string "number", limit: 6, null: false
    t.integer "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_id", default: 0, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.integer "category", null: false
    t.string "type"
    t.string "choice1", default: "test1", null: false
    t.string "choice2", default: "test2", null: false
    t.string "choice3"
    t.string "choice4"
    t.string "countA", limit: 6, default: "000000", null: false
    t.string "countB", limit: 6, default: "000000", null: false
    t.string "image_url"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "age", null: false
    t.string "sex", null: false
    t.string "area", null: false
    t.string "status", null: false
    t.string "distance", null: false
    t.string "importance", null: false
    t.string "values_result", null: false
    t.string "personality_result", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name", limit: 12, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selected", default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "sub"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "questions", "surveys"
end
