# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_22_144453) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "appearance"
    t.string "pronouns"
    t.integer "user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "char_id"
    t.integer "story_id"
    t.string "choice"
  end

  create_table "stories", force: :cascade do |t|
    t.string "text"
    t.string "choice1"
    t.string "choice2"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
