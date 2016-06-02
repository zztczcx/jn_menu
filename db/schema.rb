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

ActiveRecord::Schema.define(version: 20160531014150) do

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "menus_appeared"
    t.integer  "times_appeared"
    t.integer  "first_appeared"
    t.string   "last_appeared"
    t.string   "integer"
    t.float    "lowest_price"
    t.float    "highest_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.integer  "menu_page_id"
    t.float    "price"
    t.float    "high_price"
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "xpos"
    t.float    "ypos"
  end

  create_table "menu_pages", force: true do |t|
    t.integer  "menu_id"
    t.integer  "page_number"
    t.integer  "image_id"
    t.integer  "full_height"
    t.integer  "full_width"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "name"
    t.string   "sponsor"
    t.string   "event"
    t.string   "venue"
    t.string   "place"
    t.text     "physical_description"
    t.string   "occasion"
    t.text     "notes"
    t.string   "call_number"
    t.string   "keywords"
    t.string   "language"
    t.datetime "date"
    t.string   "location"
    t.string   "location_type"
    t.string   "currency"
    t.string   "currency_symbol"
    t.string   "status"
    t.integer  "page_count"
    t.integer  "dish_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
