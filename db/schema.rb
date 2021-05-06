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

ActiveRecord::Schema.define(version: 2021_04_30_202338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "acts_as_bookable_bookings", force: :cascade do |t|
    t.string "bookable_type"
    t.bigint "bookable_id"
    t.string "booker_type"
    t.bigint "booker_id"
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

  create_table "anfrages", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telefon"
    t.integer "anzahl"
    t.text "antwort"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nachricht"
  end

  create_table "bestellpositions", force: :cascade do |t|
    t.integer "menge"
    t.float "preis"
    t.bigint "bestellung_id", null: false
    t.bigint "produkt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bestellung_id"], name: "index_bestellpositions_on_bestellung_id"
    t.index ["produkt_id"], name: "index_bestellpositions_on_produkt_id"
  end

  create_table "bestellungs", force: :cascade do |t|
    t.string "status"
    t.datetime "abholdatum"
    t.string "zahlungsmethode"
    t.boolean "bezahlt", default: false
    t.boolean "abgeholt", default: false
    t.text "notiz"
    t.float "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bestellungs_on_user_id"
  end

  create_table "brotbestellposis", force: :cascade do |t|
    t.integer "menge"
    t.bigint "brotsorte_id"
    t.bigint "brotbestellung_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brotbestellung_id"], name: "index_brotbestellposis_on_brotbestellung_id"
    t.index ["brotsorte_id"], name: "index_brotbestellposis_on_brotsorte_id"
  end

  create_table "brotbestellscheins", force: :cascade do |t|
    t.datetime "datum"
    t.datetime "versendet"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brotbestellungs", force: :cascade do |t|
    t.string "vorname"
    t.string "name"
    t.string "telefon"
    t.string "email"
    t.datetime "datum"
    t.string "typ", default: "bestellung"
    t.bigint "brotbestellschein_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brotbestellschein_id"], name: "index_brotbestellungs_on_brotbestellschein_id"
  end

  create_table "brotsortes", force: :cascade do |t|
    t.string "name"
    t.boolean "aktiv"
    t.boolean "ausverkauft"
    t.bigint "brottyp_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brottyp_id"], name: "index_brotsortes_on_brottyp_id"
  end

  create_table "brottyps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title_details"
    t.text "text_details"
    t.boolean "deaktiviert", default: false
    t.boolean "vorschaubild", default: false
  end

  create_table "fewos", force: :cascade do |t|
    t.integer "capacity"
    t.text "schedule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kategories", force: :cascade do |t|
    t.string "name"
    t.boolean "aktiv"
    t.boolean "brotbestellung"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mieters", force: :cascade do |t|
    t.string "name"
    t.string "vorname"
    t.string "telefon"
    t.string "email"
    t.string "strasse"
    t.integer "plz"
    t.string "ort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "openhours", force: :cascade do |t|
    t.string "tag"
    t.time "start"
    t.time "ende"
    t.boolean "spezial"
    t.boolean "geschlossen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "reihenfolge", default: 1
    t.boolean "without_time", default: false
  end

  create_table "produkts", force: :cascade do |t|
    t.string "name"
    t.boolean "aktiv"
    t.boolean "ausverkauft"
    t.float "preis"
    t.bigint "kategorie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kategorie_id"], name: "index_produkts_on_kategorie_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vorname"
    t.string "telefon"
    t.string "strasse"
    t.integer "plz"
    t.string "ort"
    t.boolean "gast"
    t.boolean "admin"
  end

  create_table "warenkorbpositions", force: :cascade do |t|
    t.integer "menge"
    t.bigint "warenkorb_id", null: false
    t.bigint "produkt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["produkt_id"], name: "index_warenkorbpositions_on_produkt_id"
    t.index ["warenkorb_id"], name: "index_warenkorbpositions_on_warenkorb_id"
  end

  create_table "warenkorbs", force: :cascade do |t|
    t.string "gutschein"
    t.datetime "abholdatum"
    t.boolean "gast"
    t.text "notiz"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_warenkorbs_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bestellpositions", "bestellungs"
  add_foreign_key "bestellpositions", "produkts"
  add_foreign_key "bestellungs", "users"
  add_foreign_key "brotbestellposis", "brotbestellungs"
  add_foreign_key "brotbestellposis", "brotsortes"
  add_foreign_key "brotbestellungs", "brotbestellscheins"
  add_foreign_key "brotsortes", "brottyps"
  add_foreign_key "produkts", "kategories", column: "kategorie_id"
  add_foreign_key "warenkorbpositions", "produkts"
  add_foreign_key "warenkorbpositions", "warenkorbs"
  add_foreign_key "warenkorbs", "users"
end
