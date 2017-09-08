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

ActiveRecord::Schema.define(version: 20170908113439) do

  create_table "group_trainers", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_trainers_on_group_id"
    t.index ["trainer_id"], name: "index_group_trainers_on_trainer_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_groups_on_user_id_and_created_at"
  end

  create_table "hall_groups", force: :cascade do |t|
    t.integer  "hall_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_hall_groups_on_group_id"
    t.index ["hall_id"], name: "index_hall_groups_on_hall_id"
  end

  create_table "halls", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_halls_on_user_id_and_created_at"
  end

  create_table "sportsmen", force: :cascade do |t|
    t.string   "address"
    t.integer  "user_id"
    t.integer  "trainer_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_sportsmen_on_group_id"
    t.index ["trainer_id"], name: "index_sportsmen_on_trainer_id"
    t.index ["user_id", "created_at"], name: "index_sportsmen_on_user_id_and_created_at"
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "qualif"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_trainers_on_user_id_and_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
