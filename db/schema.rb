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

ActiveRecord::Schema.define(:version => 20110330191346) do

  create_table "shorts", :force => true do |t|
    t.string   "expanded"
    t.string   "contracted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "cached_slug"
    t.integer  "user_id"
  end

  add_index "shorts", ["contracted"], :name => "index_shorts_on_contracted"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key"
  end

  add_index "users", ["api_key"], :name => "index_users_on_api_key", :unique => true

  create_table "visits", :force => true do |t|
    t.integer  "short_id"
    t.string   "referred"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ipaddress"
  end

  add_index "visits", ["short_id"], :name => "index_visits_on_short_id"

end
