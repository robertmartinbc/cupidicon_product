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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130802222022) do

  create_table "assignments", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "category"
    t.integer  "word_count"
    t.string   "language"
    t.string   "rating"
    t.text     "key_words"
    t.float    "cost"
    t.string   "style"
    t.text     "instructions"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "state"
  end

  add_index "assignments", ["state"], :name => "index_assignments_on_state"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comments", ["assignment_id"], :name => "index_comments_on_assignment_id"

  create_table "submissions", :force => true do |t|
    t.text     "description"
    t.integer  "writer_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "submissions", ["assignment_id"], :name => "index_submissions_on_assignment_id"
  add_index "submissions", ["writer_id"], :name => "index_submissions_on_writer_id"

  create_table "transactions", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "writer_id"
    t.string   "transaction_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "avatar"
    t.integer  "state"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
