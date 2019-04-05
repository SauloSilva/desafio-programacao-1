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

ActiveRecord::Schema.define(version: 2019_04_03_223031) do

  create_table "importers", force: :cascade do |t|
    t.string "file"
    t.decimal "gross_value", precision: 9, scale: 2, default: "0.0"
    t.string "status"
    t.datetime "imported_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.decimal "price", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_items_on_description"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_merchants_on_name"
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_purchasers_on_name"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "merchant_id"
    t.integer "item_id"
    t.integer "purchaser_id"
    t.integer "importer_id"
    t.integer "quantity"
    t.decimal "gross_value", precision: 9, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["importer_id"], name: "index_purchases_on_importer_id"
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["merchant_id", "item_id", "purchaser_id", "importer_id"], name: "index_purchases_on_reference_ids"
    t.index ["merchant_id"], name: "index_purchases_on_merchant_id"
    t.index ["purchaser_id"], name: "index_purchases_on_purchaser_id"
  end

end
