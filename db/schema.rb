# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160313064334) do

  create_table "classofhots", force: :cascade do |t|
    t.string   "lecture_code"
    t.string   "lecture_title"
    t.string   "professor_name"
    t.string   "typeof_lecture"
    t.string   "typeof_hospi"
    t.string   "lecture_major"
    t.string   "dateof_lecture"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "classofhots_majors", id: false, force: :cascade do |t|
    t.integer  "classofhot_id"
    t.integer  "major_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "classofhots_majors", ["classofhot_id"], name: "index_classofhots_majors_on_classofhot_id"
  add_index "classofhots_majors", ["major_id"], name: "index_classofhots_majors_on_major_id"

  create_table "majors", force: :cascade do |t|
    t.string   "major_code"
    t.string   "major_title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proscons", force: :cascade do |t|
    t.integer  "review_id"
    t.string   "agree_user"
    t.string   "disagree_user"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "review_id"
    t.string   "reply_content"
    t.string   "reply_writer"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "classofhot_id"
    t.string   "review_content"
    t.string   "review_writer"
    t.integer  "_like"
    t.integer  "_dislike"
    t.string   "like_clicker"
    t.float    "eval_star"
    t.float    "eval_grade"
    t.float    "eval_easy"
    t.float    "eval_academic"
    t.string   "picture"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "user_major"
    t.integer  "student_num"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
