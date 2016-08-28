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

ActiveRecord::Schema.define(version: 20160825154842) do

  create_table "clients", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.string   "phone_number", limit: 255
    t.string   "city",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "surname",      limit: 255
    t.string   "email",        limit: 255
    t.string   "comments",     limit: 255
  end

  create_table "eyeglasses_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescription_distances", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_orders", force: :cascade do |t|
    t.string   "description",             limit: 255
    t.date     "date"
    t.date     "delivery_date"
    t.integer  "order_number",            limit: 4
    t.decimal  "distance_right_sph",                  precision: 10, scale: 2, default: 0.0
    t.decimal  "distance_right_cyl",                  precision: 10, scale: 2, default: 0.0
    t.integer  "distance_right_axis",     limit: 4,                            default: 0
    t.decimal  "distance_left_sph",                   precision: 10, scale: 2, default: 0.0
    t.decimal  "distance_left_cyl",                   precision: 10, scale: 2, default: 0.0
    t.integer  "distance_left_axis",      limit: 4,                            default: 0
    t.decimal  "distance_ipd",                        precision: 10, scale: 2, default: 0.0
    t.string   "distance_lens_color",     limit: 255
    t.string   "distance_frame",          limit: 255
    t.string   "distance_lens_type",      limit: 255
    t.decimal  "near_right_sph",                      precision: 10, scale: 2, default: 0.0
    t.decimal  "near_right_cyl",                      precision: 10, scale: 2, default: 0.0
    t.integer  "near_right_axis",         limit: 4,                            default: 0
    t.decimal  "near_left_sph",                       precision: 10, scale: 2, default: 0.0
    t.decimal  "near_left_cyl",                       precision: 10, scale: 2, default: 0.0
    t.integer  "near_left_axis",          limit: 4,                            default: 0
    t.decimal  "near_ipd",                            precision: 10, scale: 2, default: 0.0
    t.string   "near_lens_color",         limit: 255
    t.string   "near_frame",              limit: 255
    t.string   "near_lens_type",          limit: 255
    t.decimal  "intermediate_right_sph",              precision: 10, scale: 2, default: 0.0
    t.decimal  "intermediate_right_cyl",              precision: 10, scale: 2, default: 0.0
    t.integer  "intermediate_right_axis", limit: 4,                            default: 0
    t.decimal  "intermediate_left_sph",               precision: 10, scale: 2, default: 0.0
    t.decimal  "intermediate_left_cyl",               precision: 10, scale: 2, default: 0.0
    t.integer  "intermediate_left_axis",  limit: 4,                            default: 0
    t.decimal  "intermediate_ipd",                    precision: 10, scale: 2, default: 0.0
    t.string   "intermediate_lens_color", limit: 255
    t.string   "intermediate_frame",      limit: 255
    t.string   "intermediate_lens_type",  limit: 255
    t.string   "bifocal",                 limit: 255
    t.decimal  "height",                              precision: 10, scale: 2, default: 0.0
    t.string   "comments",                limit: 255
    t.decimal  "invoice",                             precision: 10, scale: 2, default: 0.0
    t.decimal  "payment_on_account",                  precision: 10, scale: 2, default: 0.0
    t.decimal  "balance_due",                         precision: 10, scale: 2, default: 0.0
    t.string   "doctor_name",             limit: 255
    t.integer  "client_id",               limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "prescription_date"
  end

end
