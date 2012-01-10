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

ActiveRecord::Schema.define(:version => 20111219011810) do

  create_table "actions", :force => true do |t|
    t.integer  "owner_user_id"
    t.text     "description"
    t.integer  "associated_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internal_messages", :force => true do |t|
    t.string   "subject"
    t.integer  "target_user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medals", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.string   "phone_number"
    t.string   "address"
    t.time     "opening_time"
    t.time     "closing_time"
    t.string   "place_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.string   "highlited_food"
    t.float    "lat"
    t.float    "lng"
  end

  create_table "places_working_days", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "working_day_id"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "owner_user_id"
    t.integer  "points"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.integer  "votes"
  end

  create_table "user_medals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "medal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.integer  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fullname"
    t.integer  "points"
    t.string   "rank"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.string   "avatar_file_size"
    t.string   "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "working_days", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

end
