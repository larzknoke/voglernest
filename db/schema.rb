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

ActiveRecord::Schema.define(version: 20171202232525) do

  create_table "acts_as_bookable_bookings", force: :cascade do |t|
    t.integer  "bookable_id"
    t.string   "bookable_type"
    t.integer  "booker_id"
    t.string   "booker_type"
    t.integer  "amount"
    t.text     "schedule"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "time"
    t.boolean  "bestaetigt"
    t.datetime "created_at"
  end

  add_index "acts_as_bookable_bookings", ["bookable_type", "bookable_id"], name: "index_acts_as_bookable_bookings_bookable"
  add_index "acts_as_bookable_bookings", ["booker_type", "booker_id"], name: "index_acts_as_bookable_bookings_booker"

  create_table "brotbestellposis", force: :cascade do |t|
    t.integer  "menge"
    t.integer  "brotsorte_id"
    t.integer  "brotbestellung_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "brotbestellposis", ["brotbestellung_id"], name: "index_brotbestellposis_on_brotbestellung_id"
  add_index "brotbestellposis", ["brotsorte_id"], name: "index_brotbestellposis_on_brotsorte_id"

  create_table "brotbestellscheins", force: :cascade do |t|
    t.datetime "datum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brotbestellungs", force: :cascade do |t|
    t.string   "vorname"
    t.string   "name"
    t.string   "telefon"
    t.string   "email"
    t.datetime "datum"
    t.integer  "brotbestellschein_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "brotbestellungs", ["brotbestellschein_id"], name: "index_brotbestellungs_on_brotbestellschein_id"

  create_table "brotsortes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "aktiv"
    t.boolean  "ausverkauft"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fewos", force: :cascade do |t|
    t.integer  "capacity"
    t.text     "schedule"
    t.integer  "mieter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fewos", ["mieter_id"], name: "index_fewos_on_mieter_id"

  create_table "mieters", force: :cascade do |t|
    t.string   "name"
    t.string   "vorname"
    t.string   "telefon"
    t.string   "email"
    t.string   "strasse"
    t.integer  "plz"
    t.string   "ort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
