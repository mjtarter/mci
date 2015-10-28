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

ActiveRecord::Schema.define(version: 20151027181721) do

  create_table "properties", force: :cascade do |t|
    t.string   "property_type",        limit: 255,                          null: false
    t.string   "address",              limit: 255,                          null: false
    t.decimal  "lat",                              precision: 10
    t.decimal  "lng",                              precision: 10
    t.string   "bedrooms",             limit: 255
    t.string   "baths",                limit: 255
    t.decimal  "price",                            precision: 6,  scale: 2
    t.decimal  "price_two",                        precision: 6,  scale: 2
    t.boolean  "availability"
    t.integer  "floors",               limit: 4
    t.string   "term",                 limit: 255
    t.integer  "sqft",                 limit: 4
    t.string   "description",          limit: 255
    t.string   "facility_name",        limit: 255
    t.string   "property_manager",     limit: 255
    t.string   "office_address",       limit: 255
    t.string   "office_hours",         limit: 255
    t.string   "phone",                limit: 255
    t.string   "email",                limit: 255
    t.string   "website",              limit: 255
    t.string   "facebook",             limit: 255
    t.boolean  "ac"
    t.boolean  "microwave"
    t.boolean  "refrigerator"
    t.boolean  "washer_dryer"
    t.boolean  "dishwasher"
    t.boolean  "garbage_disposal"
    t.boolean  "patio_balcony"
    t.boolean  "walk_in_closets"
    t.boolean  "locking_room_doors"
    t.boolean  "storage_space"
    t.boolean  "furnished"
    t.boolean  "ceiling_fans"
    t.boolean  "electric_gas"
    t.boolean  "trash"
    t.boolean  "water"
    t.boolean  "cable"
    t.boolean  "internet"
    t.boolean  "dogs_allowed"
    t.boolean  "cats_allowed"
    t.boolean  "other_pets_allowed"
    t.boolean  "laundry_facilities"
    t.boolean  "computer_lab"
    t.boolean  "fitness_center"
    t.boolean  "lounge"
    t.boolean  "controlled_access"
    t.boolean  "swimming_pool"
    t.boolean  "on_site_maintenance"
    t.boolean  "courtyard"
    t.boolean  "parking"
    t.boolean  "resident_functions"
    t.boolean  "on_bus_route"
    t.boolean  "elevator"
    t.boolean  "additional_amenities"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

end
