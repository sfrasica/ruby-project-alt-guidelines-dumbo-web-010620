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

ActiveRecord::Schema.define(version: 2020_01_24_005652) do

  create_table "art_dealers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer "amount"
    t.integer "art_dealer_id"
    t.integer "work_of_gif_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "win"
    t.integer "stolen"
    t.integer "counter"
  end

  create_table "work_of_gifs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "counterfeit"
    t.boolean "available"
    t.boolean "stolen"
    t.integer "starting_bid"
    t.boolean "jezebel"
    t.boolean "won"
  end

end
