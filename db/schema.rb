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

ActiveRecord::Schema.define(version: 2021_11_22_040544) do

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "is_right"
    t.integer "questions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questions_id"], name: "index_answers_on_questions_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessions", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessions_courses", force: :cascade do |t|
    t.integer "courses_id", null: false
    t.integer "lessions_id", null: false
    t.integer "time_learn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["courses_id"], name: "index_lessions_courses_on_courses_id"
    t.index ["lessions_id"], name: "index_lessions_courses_on_lessions_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.integer "type"
    t.integer "lessions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lessions_id"], name: "index_questions_on_lessions_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "lessions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lessions_id"], name: "index_tasks_on_lessions_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "user_name"
    t.string "password_digest"
    t.string "avatar"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_courses", force: :cascade do |t|
    t.integer "courses_id", null: false
    t.integer "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["courses_id"], name: "index_users_courses_on_courses_id"
    t.index ["users_id"], name: "index_users_courses_on_users_id"
  end

  add_foreign_key "answers", "questions", column: "questions_id"
  add_foreign_key "lessions_courses", "courses", column: "courses_id"
  add_foreign_key "lessions_courses", "lessions", column: "lessions_id"
  add_foreign_key "questions", "lessions", column: "lessions_id"
  add_foreign_key "tasks", "lessions", column: "lessions_id"
  add_foreign_key "users_courses", "courses", column: "courses_id"
  add_foreign_key "users_courses", "users", column: "users_id"
end
