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

ActiveRecord::Schema.define(version: 2020_07_02_062607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.integer "type1", default: 0, null: false
    t.integer "type2", default: 0, null: false
    t.integer "type3", default: 0, null: false
    t.integer "type4", default: 0, null: false
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_characters_on_question_id"
  end

  create_table "jobnumbers", force: :cascade do |t|
    t.string "number", limit: 6, null: false
    t.integer "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_id", default: 0, null: false
  end

  create_table "personalities", force: :cascade do |t|
    t.integer "type1", default: 0, null: false
    t.integer "type2", default: 0, null: false
    t.integer "type3", default: 0, null: false
    t.integer "type4", default: 0, null: false
    t.integer "type5", default: 0, null: false
    t.integer "type6", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id", null: false
    t.index ["question_id"], name: "index_personalities_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", limit: 25, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.integer "category", default: 1, null: false
    t.integer "group", default: 1, null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
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

  add_foreign_key "characters", "questions"
  add_foreign_key "personalities", "questions"
  add_foreign_key "questions", "surveys"
end
