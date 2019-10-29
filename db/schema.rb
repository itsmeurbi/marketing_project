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

ActiveRecord::Schema.define(version: 20191029182331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_employees", force: :cascade do |t|
    t.date "start_date"
    t.date "finish_date"
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_employees_on_campaign_id"
    t.index ["user_id"], name: "index_campaign_employees_on_user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "finish_date"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "red_id"
    t.index ["client_id"], name: "index_campaigns_on_client_id"
    t.index ["red_id"], name: "index_campaigns_on_red_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cellphone"
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_name"
    t.string "contact_tel"
    t.string "contact_cel"
    t.string "contact_email"
    t.bigint "company_id"
    t.bigint "corporate_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "ceo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "corporate_id"
    t.string "razon_social"
    t.string "rfc"
    t.string "address"
    t.bigint "representative_id"
    t.index ["representative_id"], name: "index_companies_on_representative_id"
  end

  create_table "corporates", force: :cascade do |t|
    t.string "name"
    t.string "ceo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "razon_social"
    t.string "rfc"
    t.string "address"
    t.bigint "representative_id"
    t.index ["representative_id"], name: "index_corporates_on_representative_id"
  end

  create_table "nodos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.bigint "red_id"
    t.index ["ancestry"], name: "index_nodos_on_ancestry"
    t.index ["red_id"], name: "index_nodos_on_red_id"
  end

  create_table "nodos_users", id: false, force: :cascade do |t|
    t.bigint "nodo_id"
    t.bigint "user_id"
    t.index ["nodo_id"], name: "index_nodos_users_on_nodo_id"
    t.index ["user_id"], name: "index_nodos_users_on_user_id"
  end

  create_table "reds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "representatives", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "rfc"
    t.string "tel"
    t.string "cel"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descr"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday"
    t.string "status", limit: 1
    t.string "user_type", limit: 1
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unconfirmed_email"
    t.bigint "role_id"
    t.datetime "discarded_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "campaigns", "clients"
  add_foreign_key "campaigns", "reds"
  add_foreign_key "nodos", "reds"
  add_foreign_key "nodos_users", "nodos"
  add_foreign_key "nodos_users", "users"
  add_foreign_key "users", "roles"
end
