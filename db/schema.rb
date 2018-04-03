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

ActiveRecord::Schema.define(version: 20180403202111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discipline_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "discipline_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "discipline_desc_idx"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "title", null: false
    t.string "code", null: false
    t.integer "parent_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name", null: false
    t.string "position", null: false
    t.string "country_code", null: false
    t.bigint "scholar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scholar_id"], name: "index_organisations_on_scholar_id"
  end

  create_table "scholars", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discipline_id"
    t.index ["discipline_id"], name: "index_scholars_on_discipline_id"
  end

  create_table "web_urls", force: :cascade do |t|
    t.string "title", null: false
    t.string "url", null: false
    t.string "code", null: false
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.index ["linkable_type", "linkable_id"], name: "index_web_urls_on_linkable_type_and_linkable_id"
  end

  add_foreign_key "organisations", "scholars"
  add_foreign_key "scholars", "disciplines"
end
