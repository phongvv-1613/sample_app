<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
ActiveRecord::Schema.define(version: 2018_05_23_052938) do
=======
ActiveRecord::Schema.define(version: 2018_05_23_011647) do
>>>>>>> Chapter 12

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
=======
    t.string "reset_digest"
    t.datetime "reset_send_at"
>>>>>>> Chapter 12
  end

end
