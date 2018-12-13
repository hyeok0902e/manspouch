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

ActiveRecord::Schema.define(version: 20181212092409) do

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "body",       limit: 65535
    t.string   "link"
    t.string   "category"
    t.string   "keyword"
    t.string   "thumb"
    t.boolean  "normal"
    t.boolean  "dry"
    t.boolean  "oily"
    t.boolean  "complex"
    t.boolean  "sensitive"
    t.boolean  "notcare"
    t.boolean  "basecare"
    t.boolean  "hardcare"
    t.boolean  "makeup"
    t.boolean  "idol"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "contents_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "content_id"
    t.integer "tag_id"
    t.index ["content_id"], name: "index_contents_tags_on_content_id", using: :btree
    t.index ["tag_id"], name: "index_contents_tags_on_tag_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "brand"
    t.integer  "price"
    t.text     "body",       limit: 65535
    t.string   "link"
    t.string   "category"
    t.string   "keyword"
    t.float    "score",      limit: 24
    t.string   "thumb"
    t.boolean  "normal"
    t.boolean  "dry"
    t.boolean  "oily"
    t.boolean  "complex"
    t.boolean  "sensitive"
    t.boolean  "notcare"
    t.boolean  "basecare"
    t.boolean  "hardcare"
    t.boolean  "makeup"
    t.boolean  "idol"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id"
    t.integer "tag_id"
    t.index ["product_id"], name: "index_products_tags_on_product_id", using: :btree
    t.index ["tag_id"], name: "index_products_tags_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tinyimgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "alt"
    t.string   "hint"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nickname"
    t.string   "phone"
    t.string   "sex"
    t.string   "age"
    t.string   "keyword"
    t.string   "skintype"
    t.string   "usertype"
    t.string   "profile"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contents_tags", "contents"
  add_foreign_key "contents_tags", "tags"
  add_foreign_key "products_tags", "products"
  add_foreign_key "products_tags", "tags"
end
