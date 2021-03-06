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

ActiveRecord::Schema.define(:version => 20130103075300) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "date_of_event"
    t.string   "venue"
    t.text     "description"
    t.string   "organizing_team"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "menu_file_name"
    t.string   "menu_content_type"
    t.integer  "menu_file_size"
    t.datetime "menu_updated_at"
  end

  create_table "events_users", :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.string   "type_of_food"
    t.string   "name_of_food"
    t.integer  "quantity"
    t.integer  "rate_per_person"
    t.integer  "event_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "veg"
  end

  add_index "participants", ["event_id"], :name => "index_participants_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name",                                   :null => false
    t.string   "emp_id",                                 :null => false
    t.string   "role",                                   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["emp_id"], :name => "index_users_on_emp_id", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
