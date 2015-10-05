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

ActiveRecord::Schema.define(version: 20150928194621) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "surname"
    t.string   "email"
    t.string   "comments"
  end

  create_table "work_orders", force: true do |t|
    t.string   "description"
    t.date     "date"
    t.date     "delivery_date"
    t.integer  "order_number"
    t.decimal  "distance_right_sph",      precision: 10, scale: 2, default: 0.0
    t.decimal  "distance_right_cyl",      precision: 10, scale: 2, default: 0.0
    t.integer  "distance_right_axis",                              default: 0
    t.decimal  "distance_left_sph",       precision: 10, scale: 2, default: 0.0
    t.decimal  "distance_left_cyl",       precision: 10, scale: 2, default: 0.0
    t.integer  "distance_left_axis",                               default: 0
    t.decimal  "distance_ipd",            precision: 10, scale: 2, default: 0.0
    t.string   "distance_lens_color"
    t.string   "distance_frame"
    t.string   "distance_lens_type"
    t.decimal  "near_right_sph",          precision: 10, scale: 2, default: 0.0
    t.decimal  "near_right_cyl",          precision: 10, scale: 2, default: 0.0
    t.integer  "near_right_axis",                                  default: 0
    t.decimal  "near_left_sph",           precision: 10, scale: 2, default: 0.0
    t.decimal  "near_left_cyl",           precision: 10, scale: 2, default: 0.0
    t.integer  "near_left_axis",                                   default: 0
    t.decimal  "near_ipd",                precision: 10, scale: 2, default: 0.0
    t.string   "near_lens_color"
    t.string   "near_frame"
    t.string   "near_lens_type"
    t.decimal  "intermediate_right_sph",  precision: 10, scale: 2, default: 0.0
    t.decimal  "intermediate_right_cyl",  precision: 10, scale: 2, default: 0.0
    t.integer  "intermediate_right_axis",                          default: 0
    t.decimal  "intermediate_left_sph",   precision: 10, scale: 2, default: 0.0
    t.decimal  "intermediate_left_cyl",   precision: 10, scale: 2, default: 0.0
    t.integer  "intermediate_left_axis",                           default: 0
    t.decimal  "intermediate_ipd",        precision: 10, scale: 2, default: 0.0
    t.string   "intermediate_lens_color"
    t.string   "intermediate_frame"
    t.string   "intermediate_lens_type"
    t.string   "bifocal"
    t.decimal  "height",                  precision: 10, scale: 2, default: 0.0
    t.string   "comments"
    t.decimal  "invoice",                 precision: 10, scale: 2, default: 0.0
    t.decimal  "payment_on_account",      precision: 10, scale: 2, default: 0.0
    t.decimal  "balance_due",             precision: 10, scale: 2, default: 0.0
    t.string   "doctor_name"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "prescription_date"
  end

end
