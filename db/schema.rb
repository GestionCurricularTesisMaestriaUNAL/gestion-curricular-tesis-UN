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

ActiveRecord::Schema.define(version: 20170420040845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: :cascade do |t|
    t.text     "anotations"
    t.integer  "score"
    t.integer  "gradework_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["gradework_id"], name: "index_feedbacks_on_gradework_id", using: :btree
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "file_gradeworks", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.text     "description"
    t.integer  "size"
    t.integer  "gradework_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["gradework_id"], name: "index_file_gradeworks_on_gradework_id", using: :btree
  end

  create_table "gradeworks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.date     "delivery_date"
    t.date     "begin_date"
    t.time     "hour"
    t.text     "locale"
    t.string   "semester"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "file"
  end

  create_table "gradeworks_users", force: :cascade do |t|
    t.integer  "gradework_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["gradework_id"], name: "index_gradeworks_users_on_gradework_id", using: :btree
    t.index ["user_id"], name: "index_gradeworks_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_roles_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "identification"
    t.integer  "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  add_foreign_key "feedbacks", "gradeworks"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "file_gradeworks", "gradeworks"
  add_foreign_key "gradeworks_users", "gradeworks"
  add_foreign_key "gradeworks_users", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
end
