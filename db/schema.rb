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

ActiveRecord::Schema.define(version: 20180828113619) do

  create_table "claims_tats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "genweb_claim_id"
    t.date "completion_of_document"
    t.date "assigned_to_adjuster"
    t.date "approved"
    t.date "loa"
    t.date "out_from_shop"
    t.date "received_invoice"
    t.date "payment_request"
    t.date "to_audit"
    t.date "to_treasury"
    t.boolean "with_estimate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
