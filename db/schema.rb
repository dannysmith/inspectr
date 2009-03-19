# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090317184922) do

  create_table "cadets", :force => true do |t|
    t.string   "surname"
    t.string   "firstname"
    t.integer  "user_id"
    t.string   "email"
    t.boolean  "standing_order"
    t.datetime "date_added"
    t.boolean  "discharged"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "balance",        :default => 0.0
  end

  create_table "inspections", :force => true do |t|
    t.integer  "cadet_id"
    t.date     "date"
    t.integer  "score"
    t.boolean  "authorized_absent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "cadet_id"
    t.float    "ammount"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_attempts",   :default => 0,                     :null => false
    t.float    "amount_per_month"
    t.datetime "last_login",       :default => '2009-02-26 20:01:27'
  end

end
