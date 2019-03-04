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

ActiveRecord::Schema.define(version: 20190303234903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountability_partnerships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "accountability_partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "goal_id"
    t.integer "journal_entry_id"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_comments_on_ancestry"
    t.index ["goal_id"], name: "index_comments_on_goal_id"
    t.index ["journal_entry_id"], name: "index_comments_on_journal_entry_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "goal_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "sport"
    t.string "goalType"
    t.date "goalStartDate"
    t.date "goalEndDate"
    t.boolean "training"
    t.boolean "recurring"
    t.string "goalInterval"
    t.integer "goalNumber"
    t.string "trainingType"
    t.string "description"
    t.float "percentComplete"
    t.boolean "active"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "ancestry"
    t.string "name"
    t.integer "trainingTimeInterval"
    t.integer "team_id"
    t.date "recurringEndDate"
    t.index ["ancestry"], name: "index_goals_on_ancestry"
    t.index ["team_id"], name: "index_goals_on_team_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "goals_journal_entries", id: false, force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.bigint "journal_entry_id", null: false
    t.index ["goal_id", "journal_entry_id"], name: "index_goals_journal_entries_on_goal_id_and_journal_entry_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.string "sport"
    t.datetime "dateTimeOfTraining"
    t.integer "duration"
    t.boolean "organizedPractice"
    t.text "trainingAccomplished"
    t.integer "motivationLevel"
    t.integer "performanceLevel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "team_id"
    t.integer "practice_players", default: [], array: true
    t.index ["team_id"], name: "index_journal_entries_on_team_id"
    t.index ["user_id"], name: "index_journal_entries_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  create_table "team_user_relationships", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sport"
  end

  create_table "training_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
