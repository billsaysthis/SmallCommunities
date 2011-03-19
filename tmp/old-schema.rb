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

ActiveRecord::Schema.define(:version => 20110312235628) do

  create_table "attendances", :force => true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title",                                 :null => false
    t.string   "subtitle"
    t.datetime "occurs_on",                             :null => false
    t.text     "description"
    t.string   "regular_paypal"
    t.string   "special_paypal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "special_pricing"
    t.boolean  "is_special"
    t.string   "special_layout_name"
    t.boolean  "show_sponsors",       :default => true
  end

  create_table "members", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "first_name",                                          :null => false
    t.string   "last_name",                                           :null => false
    t.datetime "joined_on",                                           :null => false
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "url"
    t.string   "logo"
    t.string   "label"
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
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "foursquare"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "memberships", :force => true do |t|
    t.integer  "member_id"
    t.string   "mtype",           :null => false
    t.string   "year",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "volunteer_title"
  end

  create_table "photos", :force => true do |t|
    t.string   "filename"
    t.boolean  "active"
    t.string   "location"
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
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "settings", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "value",                         :null => false
    t.boolean  "is_html",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

end
