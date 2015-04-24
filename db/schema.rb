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

ActiveRecord::Schema.define(version: 20150424072439) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "abstact"
    t.string   "content"
    t.integer  "status"
    t.boolean  "home"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "categories_id"
    t.string   "avatar"
  end

  create_table "articles_tags", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "news_id"
    t.integer  "comments_id"
    t.integer  "reply_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "navigations", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "online_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
