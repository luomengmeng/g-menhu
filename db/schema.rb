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

ActiveRecord::Schema.define(version: 20150504050105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "abstact"
    t.string   "content"
    t.integer  "status"
    t.boolean  "home"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
    t.integer  "category_id"
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
    t.string   "online_time"
    t.string  "name"
    t.string  "name_url"
    t.integer  "province_id"
    t.string  "abstract"
    t.string  "area"
    t.string  "online_time"
    t.string  "registered_capital"
    t.string  "average_income"
    t.string  "with_income"
    t.string  "investment_period"
    t.integer  "auto_bidding"
    t.string  "creditor"
    t.string  "trust_funds"
    t.string  "tender_guarantee"
    t.string  "security_mode"
    t.string  "guarantee_agency"
    t.string  "management_fee"
    t.string  "prepaid_fee"
    t.string  "withdrawal_fee"
    t.string  "vip_fee"
    t.string  "transfer_fee"
    t.string  "method_payment"
    t.string  "address"
    t.string  "free_phone"
    t.string  "phone"
    t.string  "fax"
    t.string  "mail"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "account_type"
    t.string   "password"
  end

end
