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

ActiveRecord::Schema.define(version: 20150421213712) do

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "integer",   null: false
    t.integer "book_id",   null: false
  end

  add_index "authors_books", ["author_id"], name: "index_authors_books_on_author_id"
  add_index "authors_books", ["book_id"], name: "index_authors_books_on_book_id"

  create_table "books", force: :cascade do |t|
    t.string   "title",       limit: 255,                         null: false
    t.string   "isbn",        limit: 13
    t.text     "description"
    t.decimal  "price",                   precision: 8, scale: 2
    t.string   "cover_image"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "authors"
    t.string   "picture"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "cart_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity",                             default: 1
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["book_id"], name: "index_cart_items_on_book_id"
  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.text     "params"
    t.integer  "cart_id"
    t.string   "status"
    t.string   "transaction_id"
    t.string   "create"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
