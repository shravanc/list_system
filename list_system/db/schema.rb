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

ActiveRecord::Schema.define(version: 2019_11_20_235639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_items", force: :cascade do |t|
    t.integer "app_id"
    t.integer "item_id"
    t.integer "app_items_counts", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_lists", force: :cascade do |t|
    t.integer "app_id"
    t.integer "list_id"
    t.integer "number", default: 0
    t.integer "app_list_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps", force: :cascade do |t|
    t.string "title", default: ""
    t.string "auth_token", default: ""
    t.string "slug", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer "list_id"
    t.integer "sublist_id"
    t.integer "number", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_layouts", force: :cascade do |t|
    t.integer "item_id"
    t.integer "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_lists", force: :cascade do |t|
    t.integer "item_id"
    t.integer "list_id"
    t.integer "number", default: 0
    t.integer "item_lists_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_media", force: :cascade do |t|
    t.integer "item_id"
    t.integer "medium_id"
    t.integer "numbder", default: 0
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title", default: ""
    t.string "description", default: ""
    t.string "slug", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "layouts", force: :cascade do |t|
    t.string "title", default: ""
    t.string "description", default: ""
    t.string "limit", default: "0"
    t.string "slug", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_layouts", force: :cascade do |t|
    t.integer "list_id"
    t.integer "layout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_media", force: :cascade do |t|
    t.integer "list_id"
    t.integer "medium_id"
    t.integer "number", default: 0
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "title", default: ""
    t.string "description", default: ""
    t.string "slug", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string "title", default: ""
    t.string "description", default: ""
    t.string "url", default: ""
    t.string "media_type", default: ""
    t.string "slug", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "title", default: ""
    t.string "subdomain", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
