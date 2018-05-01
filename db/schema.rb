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

ActiveRecord::Schema.define(version: 20180501000246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_assets", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "campaign_assetable_id"
    t.string   "campaign_assetable_type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["campaign_assetable_id", "campaign_assetable_type"], name: "campaign_asset_id_type_index", using: :btree
    t.index ["campaign_id"], name: "index_campaign_assets_on_campaign_id", using: :btree
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "slug",                      null: false
    t.string   "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id", using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description", limit: 65535
    t.string   "biography",   limit: 65535
    t.integer  "hitpoints"
    t.string   "alignment"
    t.string   "race"
    t.string   "gender"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_characters_on_user_id", using: :btree
  end

  create_table "encounters", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "segment_id"
    t.string   "name"
    t.string   "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["campaign_id"], name: "index_encounters_on_campaign_id", using: :btree
    t.index ["segment_id"], name: "index_encounters_on_segment_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description", limit: 65535
    t.string   "value"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "monsters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description", limit: 65535
    t.integer  "hitpoints"
    t.string   "hit"
    t.string   "damage"
    t.string   "armor_class"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_monsters_on_user_id", using: :btree
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "description", limit: 65535
    t.string   "key_url",                   null: false
    t.integer  "campaign_id"
    t.text     "log"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["campaign_id"], name: "index_segments_on_campaign_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "allow_password_change",  default: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
