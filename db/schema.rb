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

ActiveRecord::Schema.define(version: 20160409064947) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "answer_text",                    null: false
    t.boolean  "correct_answer", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "categories", force: true do |t|
    t.integer  "topic_id"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["topic_id"], name: "index_categories_on_topic_id"

  create_table "games", force: true do |t|
    t.integer  "quiz_id"
    t.datetime "starts_at"
    t.string   "name"
    t.integer  "max_players"
    t.decimal  "entry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["quiz_id"], name: "index_games_on_quiz_id"

  create_table "participation_answers", force: true do |t|
    t.integer  "participation_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participation_answers", ["answer_id"], name: "index_participation_answers_on_answer_id"
  add_index "participation_answers", ["participation_id"], name: "index_participation_answers_on_participation_id"

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "ranking",                default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "finished",               default: false
    t.integer  "current_question_index", default: 0
    t.integer  "score",                  default: 0
  end

  add_index "participations", ["game_id"], name: "index_participations_on_game_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "points_allocations", force: true do |t|
    t.integer  "game_id"
    t.integer  "place",      null: false
    t.integer  "points",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points_allocations", ["game_id"], name: "index_points_allocations_on_game_id"

  create_table "questions", force: true do |t|
    t.integer  "category_id"
    t.string   "question_text", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id"

  create_table "quiz_questions", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_questions", ["question_id"], name: "index_quiz_questions_on_question_id"
  add_index "quiz_questions", ["quiz_id"], name: "index_quiz_questions_on_quiz_id"

  create_table "quizzes", force: true do |t|
    t.integer  "category_id"
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quizzes", ["category_id"], name: "index_quizzes_on_category_id"

  create_table "reservations", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "stacks", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.integer "chips",   default: 0
  end

  create_table "topics", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "city"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin"
    t.string   "timezone"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "wallets", force: true do |t|
    t.integer "game_id"
    t.integer "wallet",  default: 0
  end

end
