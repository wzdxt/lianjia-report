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

ActiveRecord::Schema.define(version: 20170308144351) do

  create_table "chengjiao", force: :cascade do |t|
    t.string   "name",       limit: 100, default: "", null: false
    t.string   "page_id",    limit: 20,               null: false
    t.string   "qu",         limit: 20
    t.string   "bankuai",    limit: 20
    t.date     "date"
    t.float    "size",       limit: 24
    t.integer  "unit_price", limit: 4,                null: false
    t.integer  "price",      limit: 4,                null: false
    t.string   "pic",        limit: 200,              null: false
    t.string   "louceng",    limit: 20
    t.string   "room",       limit: 20
    t.string   "chaoxiang",  limit: 20
    t.string   "zhuangxiu",  limit: 20
    t.datetime "created_at",                          null: false
    t.datetime "updated_at"
  end

  add_index "chengjiao", ["page_id"], name: "page_id", unique: true, using: :btree

  create_table "ershoufang", force: :cascade do |t|
    t.string   "page_id",        limit: 100
    t.string   "name",           limit: 100
    t.integer  "size",           limit: 4
    t.string   "xiaoqu",         limit: 50
    t.string   "bankuai",        limit: 20
    t.string   "qu",             limit: 20
    t.string   "xiaoqu_page_id", limit: 100
    t.date     "sold_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price",          limit: 4
    t.integer  "unit_price",     limit: 4
  end

  add_index "ershoufang", ["page_id"], name: "page_id", unique: true, using: :btree

  create_table "ershoufang_price", force: :cascade do |t|
    t.integer  "ershoufang_id", limit: 4
    t.integer  "xiaoqu_id",     limit: 4
    t.integer  "price",         limit: 4
    t.integer  "unit_price",    limit: 4
    t.integer  "prev_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ershoufang_price", ["ershoufang_id", "prev_id"], name: "ershoufang_id", unique: true, using: :btree

  create_table "num", force: :cascade do |t|
  end

  create_table "wechat_sessions", force: :cascade do |t|
    t.string   "openid",     limit: 255, null: false
    t.string   "hash_store", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wechat_sessions", ["openid"], name: "index_wechat_sessions_on_openid", unique: true, using: :btree

  create_table "xiaoqu", force: :cascade do |t|
    t.string   "page_id",    limit: 100
    t.string   "name",       limit: 100
    t.integer  "number",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fav",        limit: 4,   default: 0
    t.string   "bankuai",    limit: 20
    t.string   "qu",         limit: 20
  end

  add_index "xiaoqu", ["page_id"], name: "page_id", unique: true, using: :btree
  add_index "xiaoqu", ["page_id"], name: "page_id_2", using: :btree

  add_foreign_key "ershoufang_price", "ershoufang", name: "ershoufang_price_ibfk_1"
end
