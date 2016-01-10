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

ActiveRecord::Schema.define(version: 20160110203742) do

  create_table "dorms", force: :cascade do |t|
    t.string   "name",                    limit: 255,                           null: false
    t.decimal  "lat",                                   precision: 8, scale: 6
    t.decimal  "lng",                                   precision: 8, scale: 6
    t.string   "location",                limit: 255
    t.string   "phone",                   limit: 255
    t.string   "email",                   limit: 255
    t.string   "address",                 limit: 255
    t.string   "dorm_type",               limit: 255
    t.integer  "floors",                  limit: 4
    t.string   "beds",                    limit: 255
    t.string   "rooms",                   limit: 255
    t.string   "bathrooms",               limit: 255
    t.string   "gender_on_floor",         limit: 255
    t.text     "description",             limit: 65535
    t.string   "price",                   limit: 255
    t.string   "parking_zone",            limit: 255
    t.boolean  "academic_support_center"
    t.boolean  "computer_lab"
    t.boolean  "library"
    t.boolean  "ud_academic_advising"
    t.boolean  "ac"
    t.boolean  "carpet_in_room"
    t.boolean  "dining_onsite"
    t.boolean  "music_practice_room"
    t.boolean  "piano"
    t.boolean  "dance_studio"
    t.boolean  "exercise_room"
    t.boolean  "game_room"
    t.boolean  "laundry_on_floor"
    t.boolean  "laundry_ground_floor"
    t.boolean  "quiet_study_area"
    t.boolean  "community_kitchen"
    t.boolean  "iu_secure_wifi"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "property_type",        limit: 255,                                    null: false
    t.string   "address",              limit: 255,                                    null: false
    t.string   "city",                 limit: 255,                                    null: false
    t.string   "state",                limit: 255,                                    null: false
    t.float    "lat",                  limit: 24
    t.float    "lng",                  limit: 24
    t.string   "bedrooms",             limit: 255
    t.string   "baths",                limit: 255
    t.decimal  "rent",                                  precision: 6
    t.decimal  "rent_two",                              precision: 6
    t.boolean  "availability"
    t.date     "date_available"
    t.integer  "floors",               limit: 4
    t.integer  "term_number",          limit: 4
    t.string   "term",                 limit: 255
    t.integer  "sqft",                 limit: 4
    t.integer  "sqft_two",             limit: 4
    t.text     "description",          limit: 16777215
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
    t.string   "additional_amenities", limit: 255
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.boolean  "approved",                                            default: false
    t.string   "status",               limit: 255
    t.integer  "user_id",              limit: 4
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
