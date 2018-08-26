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

ActiveRecord::Schema.define(version: 2018_08_19_113933) do

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

  create_table "list_items", force: :cascade do |t|
    t.string "label", null: false
    t.integer "position", null: false
    t.bigint "list_id"
    t.index ["list_id"], name: "index_list_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "code", null: false
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

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "scholar_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.json "metadata", default: {}
    t.integer "sort_key", null: false
    t.boolean "most_recent", null: false
    t.bigint "scholar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.index ["created_by_id"], name: "index_scholar_transitions_on_created_by_id"
    t.index ["scholar_id", "most_recent"], name: "index_scholar_transitions_parent_most_recent", unique: true, where: "most_recent"
    t.index ["scholar_id", "sort_key"], name: "index_scholar_transitions_parent_sort", unique: true
    t.index ["scholar_id"], name: "index_scholar_transitions_on_scholar_id"
  end

  create_table "scholars", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discipline_id"
    t.string "state"
    t.bigint "created_by_id"
    t.index ["created_by_id"], name: "index_scholars_on_created_by_id"
    t.index ["discipline_id"], name: "index_scholars_on_discipline_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "web_urls", force: :cascade do |t|
    t.string "title", null: false
    t.string "url", null: false
    t.string "code", null: false
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.index ["linkable_type", "linkable_id"], name: "index_web_urls_on_linkable_type_and_linkable_id"
  end

  add_foreign_key "list_items", "lists"
  add_foreign_key "organisations", "scholars"
  add_foreign_key "people", "users"
  add_foreign_key "scholar_transitions", "people", column: "created_by_id"
  add_foreign_key "scholar_transitions", "scholars"
  add_foreign_key "scholars", "disciplines"
  add_foreign_key "scholars", "people", column: "created_by_id"
  add_foreign_key "users", "people"
end
