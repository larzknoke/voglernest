# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_22_210540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts_as_bookable_bookings", id: :serial, force: :cascade do |t|
    t.integer "bookable_id"
    t.string "bookable_type"
    t.integer "booker_id"
    t.string "booker_type"
    t.integer "amount"
    t.text "schedule"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "time"
    t.boolean "bestaetigt"
    t.datetime "created_at"
    t.string "typ", default: "std"
    t.string "notiz", default: ""
    t.index ["bookable_type", "bookable_id"], name: "index_acts_as_bookable_bookings_bookable"
    t.index ["booker_type", "booker_id"], name: "index_acts_as_bookable_bookings_booker"
  end

  create_table "anfrages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telefon"
    t.integer "anzahl"
    t.text "antwort"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nachricht"
  end

  create_table "brotbestellposis", id: :serial, force: :cascade do |t|
    t.integer "menge"
    t.integer "brotsorte_id"
    t.integer "brotbestellung_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brotbestellung_id"], name: "index_brotbestellposis_on_brotbestellung_id"
    t.index ["brotsorte_id"], name: "index_brotbestellposis_on_brotsorte_id"
  end

  create_table "brotbestellscheins", id: :serial, force: :cascade do |t|
    t.datetime "datum"
    t.datetime "versendet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brotbestellungs", id: :serial, force: :cascade do |t|
    t.string "vorname"
    t.string "name"
    t.string "telefon"
    t.string "email"
    t.datetime "datum"
    t.string "typ", default: "bestellung"
    t.integer "brotbestellschein_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brotbestellschein_id"], name: "index_brotbestellungs_on_brotbestellschein_id"
  end

  create_table "brotsortes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "aktiv"
    t.boolean "ausverkauft"
    t.integer "brottyp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brotbild_file_name"
    t.string "brotbild_content_type"
    t.integer "brotbild_file_size"
    t.datetime "brotbild_updated_at"
    t.index ["brottyp_id"], name: "index_brotsortes_on_brottyp_id"
  end

  create_table "brottyps", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_details"
  end

  create_table "fewos", id: :serial, force: :cascade do |t|
    t.integer "capacity"
    t.text "schedule"
    t.integer "mieter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mieter_id"], name: "index_fewos_on_mieter_id"
  end

  create_table "mieters", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "vorname"
    t.string "telefon"
    t.string "email"
    t.string "strasse"
    t.integer "plz"
    t.string "ort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "openhours", id: :serial, force: :cascade do |t|
    t.string "tag"
    t.time "start"
    t.time "ende"
    t.boolean "spezial"
    t.boolean "geschlossen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reihenfolge", default: 1
    t.boolean "without_time", default: false
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "brotbestellposis", "brotbestellungs"
  add_foreign_key "brotbestellposis", "brotsortes"
  add_foreign_key "brotbestellungs", "brotbestellscheins"
  add_foreign_key "brotsortes", "brottyps"
  add_foreign_key "fewos", "mieters"
end
