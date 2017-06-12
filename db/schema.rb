
ActiveRecord::Schema.define(version: 20170608045642) do

  create_table "move_wods", force: :cascade do |t|
    t.integer  "movement_id"
    t.integer  "wod_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "movements", force: :cascade do |t|
    t.string   "name"
    t.string   "movement_type"
    t.integer  "quantity"
    t.integer  "owner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "usermovements", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.string   "movement_type"
    t.float    "result"
    t.boolean  "pr",            default: false
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "owner",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "userwods", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.float    "result"
    t.boolean  "pr",         default: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "wods", force: :cascade do |t|
    t.string   "title"
    t.string   "wod_type"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
