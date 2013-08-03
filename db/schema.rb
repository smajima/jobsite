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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130731113344) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "applies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.boolean  "result",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "applies", ["job_id"], :name => "index_applies_on_job_id"
  add_index "applies", ["user_id"], :name => "index_applies_on_user_id"

  create_table "c_managers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "company_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "c_managers", ["email"], :name => "index_c_managers_on_email", :unique => true
  add_index "c_managers", ["reset_password_token"], :name => "index_c_managers_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.date     "established_date"
    t.string   "ceo"
    t.integer  "capital"
    t.integer  "employee_number"
    t.text     "works"
    t.string   "url"
    t.string   "address"
    t.string   "one_word"
    t.text     "summary"
    t.integer  "p_mamanger_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "job_histories", :force => true do |t|
    t.integer  "resume_id"
    t.integer  "number"
    t.datetime "start_month"
    t.datetime "end_month"
    t.string   "company_name"
    t.string   "hiring_type"
    t.text     "detail"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "job_id"
    t.string   "title"
    t.string   "occupation"
    t.text     "background"
    t.text     "detail"
    t.string   "hiring_type"
    t.text     "credentials"
    t.string   "work_place"
    t.string   "work_time"
    t.text     "salary"
    t.text     "compensation"
    t.text     "holidays"
    t.datetime "posting_start"
    t.datetime "posting_end"
    t.integer  "job_category"
    t.integer  "company_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "mails", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "direction"
    t.string   "status"
    t.integer  "apply_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mails", ["apply_id"], :name => "index_mails_on_apply_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "kana_first_name"
    t.string   "kana_last_name"
    t.datetime "birthday"
    t.string   "zip"
    t.integer  "pref_code"
    t.string   "address0"
    t.string   "address1"
    t.string   "address2"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "contact_method"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "resumes", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
