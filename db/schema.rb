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

ActiveRecord::Schema.define(version: 20150427141404) do

  create_table "namespaces", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.date     "date_begin"
    t.date     "date_end"
    t.text     "description",  limit: 65535
    t.boolean  "status",       limit: 1
    t.integer  "user_id",      limit: 4
    t.integer  "namespace_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

<<<<<<< Updated upstream
  add_index "projects", ["namespace_id"], name: "fk_rails_df9a01e841", using: :btree
  add_index "projects", ["user_id"], name: "fk_rails_8d590ab40d", using: :btree
=======
  add_index "projects", ["namespace_id"], name: "fk_rails_6b4c14e9bd", using: :btree
  add_index "projects", ["user_id"], name: "fk_rails_8f34b119c2", using: :btree
>>>>>>> Stashed changes

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.integer "project_id", limit: 4
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id",  limit: 4
    t.string   "title",       limit: 255,                                   null: false
    t.text     "description", limit: 65535,                                 null: false
    t.integer  "priority",    limit: 4,     default: 1,                     null: false
    t.boolean  "done",        limit: 1,     default: false,                 null: false
    t.datetime "date_end",                  default: '2015-04-27 13:24:04', null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "task_id", limit: 4
  end

  add_index "tasks_users", ["task_id"], name: "index_tasks_users_on_task_id", using: :btree
  add_index "tasks_users", ["user_id"], name: "index_tasks_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "", null: false
    t.string   "surname",                limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  limit: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "projects", "namespaces"
  add_foreign_key "projects", "users"
end
