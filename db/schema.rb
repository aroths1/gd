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

ActiveRecord::Schema.define(:version => 20150628215134) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "destination_specific_activities", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "destination_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "destination_specific_activities", ["activity_id"], :name => "index_destination_specific_activities_on_activity_id"
  add_index "destination_specific_activities", ["destination_id"], :name => "index_destination_specific_activities_on_destination_id"

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "contact"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "destination_specific_activity_id"
    t.decimal  "price"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "items", ["destination_specific_activity_id"], :name => "index_items_on_destination_specific_activity_id"

  create_table "line_items", :force => true do |t|
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order_id"
  end

  add_index "line_items", ["item_id"], :name => "index_line_items_on_item_id"

  create_table "orders", :force => true do |t|
    t.boolean  "paid"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "participant_id"
  end

  create_table "participants", :force => true do |t|
    t.integer  "person_id"
    t.integer  "lead_participant"
    t.integer  "trip_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "participants", ["person_id"], :name => "index_participants_on_person_id"
  add_index "participants", ["trip_id"], :name => "index_participants_on_trip_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.date     "dob"
  end

  create_table "trips", :force => true do |t|
    t.integer  "group_id"
    t.integer  "destination_specific_activity_id"
    t.date     "date"
    t.integer  "leader"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "trips", ["destination_specific_activity_id"], :name => "index_trips_on_destination_specific_activity_id"
  add_index "trips", ["group_id"], :name => "index_trips_on_group_id"

  create_table "users", :force => true do |t|
    t.integer  "person_id"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
