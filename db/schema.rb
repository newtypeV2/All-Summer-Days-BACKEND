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

ActiveRecord::Schema.define(version: 2019_07_25_143757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "char_class_proficiencies", force: :cascade do |t|
    t.integer "char_class_id"
    t.integer "proficiency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "char_class_skills", force: :cascade do |t|
    t.integer "char_class_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "char_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "char_class_id"
    t.integer "level"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "hitpoints"
    t.integer "max_hp"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.string "eyes"
    t.string "skin"
    t.string "hair"
    t.string "background"
    t.string "alignment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_proficiencies", force: :cascade do |t|
    t.integer "character_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
