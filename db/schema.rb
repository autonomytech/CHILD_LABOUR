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

ActiveRecord::Schema.define(version: 20150514160410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.integer  "employer_id"
    t.integer  "raid_id"
    t.integer  "child_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "addresses", ["child_id"], name: "index_addresses_on_child_id", using: :btree
  add_index "addresses", ["employer_id"], name: "index_addresses_on_employer_id", using: :btree
  add_index "addresses", ["raid_id"], name: "index_addresses_on_raid_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "question_id"
    t.integer  "child_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["child_id"], name: "index_answers_on_child_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "gender"
    t.integer  "age"
    t.boolean  "is_child_begger", default: false
    t.integer  "employer_id"
    t.integer  "raid_id"
    t.text     "description"
    t.boolean  "is_deleted",      default: false
    t.string   "submited_by"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "children", ["employer_id"], name: "index_children_on_employer_id", using: :btree
  add_index "children", ["raid_id"], name: "index_children_on_raid_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_farms", force: :cascade do |t|
    t.integer  "raid_id"
    t.integer  "department_id"
    t.string   "involve_member"
    t.string   "submited_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "community_farms", ["department_id"], name: "index_community_farms_on_department_id", using: :btree
  add_index "community_farms", ["raid_id"], name: "index_community_farms_on_raid_id", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "contact_no"
    t.string   "email"
    t.string   "area"
    t.string   "subject"
    t.datetime "last_seen_date"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "employer_id"
  end

  add_index "complaints", ["employer_id"], name: "index_complaints_on_employer_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "departments", ["location_id"], name: "index_departments_on_location_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "contact_no"
    t.integer  "raid_id"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "employers", ["raid_id"], name: "index_employers_on_raid_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.boolean  "is_yes_no_answer"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "raids", force: :cascade do |t|
    t.string   "title"
    t.datetime "datetime"
    t.string   "description"
    t.string   "raid_for"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "complaint_id"
  end

  add_index "raids", ["complaint_id"], name: "index_raids_on_complaint_id", using: :btree
  add_index "raids", ["location_id"], name: "index_raids_on_location_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "contact_no"
    t.integer  "role_id"
    t.integer  "department_id"
    t.string   "designation"
    t.boolean  "is_deleted",             default: false
    t.boolean  "is_primary",             default: false
    t.integer  "community_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["community_id"], name: "index_users_on_community_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "addresses", "children"
  add_foreign_key "addresses", "employers"
  add_foreign_key "addresses", "raids"
  add_foreign_key "answers", "children"
  add_foreign_key "answers", "questions"
  add_foreign_key "children", "employers"
  add_foreign_key "children", "raids"
  add_foreign_key "community_farms", "departments"
  add_foreign_key "community_farms", "raids"
  add_foreign_key "complaints", "employers"
  add_foreign_key "departments", "locations"
  add_foreign_key "employers", "raids"
  add_foreign_key "raids", "complaints"
  add_foreign_key "raids", "locations"
  add_foreign_key "users", "communities"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
