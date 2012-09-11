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

ActiveRecord::Schema.define(:version => 20120911024245) do

  create_table "days", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "setting_id"
    t.integer  "periods"
    t.integer  "slots_per_period"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.integer  "setting_id"
    t.integer  "amount"
    t.integer  "icon_id"
  end

  create_table "settings", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.integer  "time_spots"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "register_price"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "shipping_address1"
    t.text     "shipping_address2"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_zipcode"
    t.string   "kind"
    t.integer  "amount"
    t.boolean  "rider"
    t.boolean  "sponsor"
    t.boolean  "pledge"
    t.integer  "time_slot"
  end

end
