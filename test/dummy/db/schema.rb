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

ActiveRecord::Schema.define(version: 20160901142139) do

  create_table "nmr_sim_nmr_simulations", force: :cascade do |t|
    t.integer  "molecule_id"
    t.text     "response_1h"
    t.text     "response_13c"
    t.text     "source"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "nmr_sim_nmr_simulations", ["deleted_at"], name: "index_nmr_sim_nmr_simulations_on_deleted_at"
  add_index "nmr_sim_nmr_simulations", ["molecule_id"], name: "index_nmr_sim_nmr_simulations_on_molecule_id"

end
