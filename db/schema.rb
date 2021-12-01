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

ActiveRecord::Schema.define(version: 2021_12_01_031826) do

  create_table "answers", charset: "utf8", force: :cascade do |t|
    t.string "content"
    t.boolean "is_right"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "courses", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
  end

  create_table "exam_details", charset: "utf8", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.integer "answer_id"
    t.bigint "exam_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_exam_details_on_exam_id"
    t.index ["question_id"], name: "index_exam_details_on_question_id"
  end

  create_table "exams", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "score"
    t.bigint "lession_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lession_id"], name: "index_exams_on_lession_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "lessions", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
    t.string "description"
  end

  create_table "lessions_courses", charset: "utf8", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "lession_id", null: false
    t.integer "time_learn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_lessions_courses_on_course_id"
    t.index ["lession_id"], name: "index_lessions_courses_on_lession_id"
  end

  create_table "questions", charset: "utf8", force: :cascade do |t|
    t.string "content"
    t.integer "typeQuestion"
    t.bigint "lession_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lession_id"], name: "index_questions_on_lession_id"
  end

  create_table "tasks", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "lession_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lession_id"], name: "index_tasks_on_lession_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "user_name"
    t.string "password_digest"
    t.string "avatar"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_courses", charset: "utf8", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_users_courses_on_course_id"
    t.index ["user_id"], name: "index_users_courses_on_user_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "exam_details", "exams"
  add_foreign_key "exam_details", "questions"
  add_foreign_key "exams", "lessions"
  add_foreign_key "exams", "users"
  add_foreign_key "lessions_courses", "courses"
  add_foreign_key "lessions_courses", "lessions"
  add_foreign_key "questions", "lessions"
  add_foreign_key "tasks", "lessions"
  add_foreign_key "users_courses", "courses"
  add_foreign_key "users_courses", "users"
end
