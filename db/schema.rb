# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_15_223906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "maidenName"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "username"
    t.string "password"
    t.string "birthDate"
    t.string "image"
    t.string "bloodGroup"
    t.integer "height"
    t.integer "weight"
    t.string "eyeColor"
    t.jsonb "hair"
    t.string "domain"
    t.string "ip"
    t.jsonb "address"
    t.string "macAddress"
    t.string "university"
    t.jsonb "bank"
    t.jsonb "company"
    t.string "ein"
    t.string "ssn"
    t.string "userAgent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end