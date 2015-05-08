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

ActiveRecord::Schema.define(:version => 20150508202421) do

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
    t.integer  "participant_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "line_items", ["item_id"], :name => "index_line_items_on_item_id"
  add_index "line_items", ["participant_id"], :name => "index_line_items_on_participant_id"

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
    t.string   "email"
    t.string   "mobile_phone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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

end