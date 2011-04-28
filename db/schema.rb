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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110427231806) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "location"
    t.string   "page_template"
    t.datetime "occurs_on"
    t.text     "description"
    t.string   "regular_paypal"
    t.string   "special_paypal"
    t.string   "special_pricing"
    t.boolean  "show_sponsors",   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",          :default => "on_sale"
  end

  create_table "linkages", :force => true do |t|
    t.string   "label"
    t.string   "url"
    t.string   "link_type"
    t.integer  "parent_id"
    t.integer  "position"
    t.boolean  "active",     :default => true
    t.boolean  "is_symbol",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lookups", :force => true do |t|
    t.string   "group"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lookups_photos", :id => false, :force => true do |t|
    t.integer  "lookup_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.string   "mtype"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "filename"
    t.boolean  "active"
    t.integer  "photo_lookup_id"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "speaker_id"
    t.string   "presentation_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "rsvps", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "is_html",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url"
    t.text     "bio"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stat_pages", :force => true do |t|
    t.string   "title"
    t.text     "content1"
    t.text     "content2"
    t.text     "content3"
    t.text     "content4"
    t.text     "content5"
    t.boolean  "show_sponsors"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "joined_on"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "url"
    t.string   "logo"
    t.string   "label"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "foursquare"
    t.string   "volunteer_title"
    t.boolean  "is_admin",                            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
