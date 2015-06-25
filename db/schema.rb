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

ActiveRecord::Schema.define(version: 20150625125804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routine_assignments", force: :cascade do |t|
    t.integer  "routine_id",  null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "finished_at"
  end

  add_index "routine_assignments", ["finished_at"], name: "index_routine_assignments_on_finished_at", using: :btree
  add_index "routine_assignments", ["routine_id"], name: "index_routine_assignments_on_routine_id", using: :btree

  create_table "routines", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "routine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["routine_id"], name: "index_tasks_on_routine_id", using: :btree

  add_foreign_key "routine_assignments", "routines"
  add_foreign_key "tasks", "routines"
end
