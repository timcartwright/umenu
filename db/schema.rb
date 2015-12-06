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

ActiveRecord::Schema.define(version: 20151206075700) do

  create_table "managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "managers", ["restaurant_id"], name: "index_managers_on_restaurant_id"
  add_index "managers", ["user_id"], name: "index_managers_on_user_id"

  create_table "menu_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
  end

  add_index "menu_categories", ["restaurant_id"], name: "index_menu_categories_on_restaurant_id"

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "menu_category_id"
  end

  add_index "menu_items", ["menu_category_id"], name: "index_menu_items_on_menu_category_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "price"
    t.integer  "quantity"
    t.string   "request"
    t.integer  "order_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "order_items", ["menu_item_id"], name: "index_order_items_on_menu_item_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "total_price"
    t.datetime "paid"
    t.datetime "fulfilled"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "orders", ["restaurant_id"], name: "index_orders_on_restaurant_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
