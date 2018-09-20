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

ActiveRecord::Schema.define(version: 20180910063530) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charge_rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "charge_type_id"
    t.string "qualifier"
    t.decimal "rate", precision: 6, scale: 2
    t.string "rate_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charge_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "shortname"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "shortname"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "brand_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perils", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "line_id"
    t.string "name"
    t.string "shortname"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "quote_id"
    t.string "online_policy_no"
    t.string "genweb_policy_no"
    t.string "genweb_bill_no"
    t.string "genweb_receipt_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "premiums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subline_id"
    t.integer "peril_id"
    t.string "subline_factor"
    t.decimal "coverage_limit", precision: 10
    t.integer "coverage_duration"
    t.decimal "premium", precision: 6, scale: 2
    t.string "prem_type"
    t.boolean "taxed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "address_1"
    t.string "address_2"
    t.integer "city_id"
    t.integer "province_id"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_charges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quote_id"
    t.integer "charge_rate_id"
    t.integer "charge_type_id"
    t.decimal "charge_amount", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_perils", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quote_id"
    t.integer "subline_id"
    t.integer "peril_id"
    t.integer "premium_id"
    t.decimal "sum_insured", precision: 12, scale: 2
    t.decimal "base_prem", precision: 12, scale: 2
    t.decimal "total_charges", precision: 12, scale: 2
    t.decimal "gross_prem", precision: 12, scale: 2
    t.integer "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_vehicles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quote_id"
    t.integer "brand_id"
    t.integer "model_id"
    t.string "plate_no"
    t.string "mv_file_no"
    t.string "engine_no"
    t.string "chassis_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subline_id"
    t.integer "peril_id"
    t.integer "premium_id"
    t.integer "policy_id"
    t.integer "user_id"
    t.decimal "coverage_limit", precision: 12, scale: 2
    t.integer "coverage_duration"
    t.decimal "base_prem", precision: 12, scale: 2
    t.decimal "total_charges", precision: 12, scale: 2
    t.decimal "gross_prem", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sublines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "line_id"
    t.string "name"
    t.string "policy_type"
    t.integer "creator_id"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.boolean "email_opt_in"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year_model"
    t.integer "brand_id"
    t.integer "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
