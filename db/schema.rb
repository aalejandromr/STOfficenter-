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

ActiveRecord::Schema.define(version: 20170909035159) do

  create_table "client_contacts", force: :cascade do |t|
    t.integer  "clients_id",  limit: 4
    t.integer  "contacts_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "nombre",                limit: 255,              null: false
    t.string   "dui",                   limit: 255, default: "", null: false
    t.string   "nit",                   limit: 255, default: "", null: false
    t.string   "giroEmpresa",           limit: 255
    t.integer  "tipoPersona_id",        limit: 4
    t.integer  "cantidadEmpleados",     limit: 4
    t.date     "fecha_de_constitucion"
    t.boolean  "empresaNacional"
    t.integer  "pais_origen_id",        limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "rec_id",                limit: 255
  end

  add_index "clients", ["pais_origen_id"], name: "fk_rails_b8f6afd9a5", using: :btree
  add_index "clients", ["tipoPersona_id"], name: "fk_rails_731c1ea404", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.text     "first_name",    limit: 65535
    t.text     "middle_name",   limit: 65535
    t.text     "last_name",     limit: 65535
    t.text     "sur_name",      limit: 65535
    t.text     "phone_contact", limit: 65535
    t.text     "mobil_contact", limit: 65535
    t.text     "email",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "position_id",   limit: 4
    t.string   "rec_id",        limit: 255
  end

  add_index "contacts", ["position_id"], name: "fk_rails_fd87a032bf", using: :btree

  create_table "pais_origens", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "positions", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "rols", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tipoPersonas", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.text     "description",            limit: 65535
    t.string   "surname",                limit: 255
    t.text     "user_name",              limit: 65535
    t.text     "password",               limit: 65535
    t.integer  "rol_id",                 limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["rol_id"], name: "index_users_on_rol_id", using: :btree

  add_foreign_key "clients", "pais_origens"
  add_foreign_key "clients", "tipoPersonas"
  add_foreign_key "contacts", "positions"
  add_foreign_key "users", "rols"
end
