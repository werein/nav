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

ActiveRecord::Schema.define(version: 20131216235812) do

  create_table "auth_assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auth_assignments", ["role_id"], name: "index_auth_assignments_on_role_id"
  add_index "auth_assignments", ["user_id"], name: "index_auth_assignments_on_user_id"

  create_table "auth_identities", force: true do |t|
    t.integer  "user_id"
    t.integer  "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auth_identities", ["user_id"], name: "index_auth_identities_on_user_id"

  create_table "auth_roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auth_users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar"
    t.string   "avatar_tmp"
    t.boolean  "xeditable",              default: false, null: false
    t.boolean  "manage",                 default: false, null: false
    t.boolean  "anonym",                 default: false, null: false
  end

  add_index "auth_users", ["confirmation_token"], name: "index_auth_users_on_confirmation_token", unique: true
  add_index "auth_users", ["email"], name: "index_auth_users_on_email", unique: true
  add_index "auth_users", ["reset_password_token"], name: "index_auth_users_on_reset_password_token", unique: true
  add_index "auth_users", ["unlock_token"], name: "index_auth_users_on_unlock_token", unique: true

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "nav_navigations", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "subtitle"
    t.string   "locale"
    t.string   "ancestry"
    t.integer  "position"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
