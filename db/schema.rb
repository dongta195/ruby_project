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

ActiveRecord::Schema.define(version: 20170623081815) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "attribute_values", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "attribute_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_id"], name: "index_attribute_values_on_attribute_id"
  end

  create_table "attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "attr_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brand_buyers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "brand_user_id"
    t.bigint "buyer_user_id"
    t.integer "rate"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_user_id"], name: "index_brand_buyers_on_brand_user_id"
    t.index ["buyer_user_id"], name: "index_brand_buyers_on_buyer_user_id"
  end

  create_table "company_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "product_image"
    t.integer "position"
    t.integer "image_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_company_images_on_user_id"
  end

  create_table "exhibitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.text "memo"
    t.string "images"
    t.integer "total_retail_sales"
    t.integer "total_wholesale_sales"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_user_id"
    t.index ["brand_user_id"], name: "index_exhibitions_on_brand_user_id"
  end

  create_table "order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.bigint "attribute_value_id"
    t.integer "quantities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price"
    t.integer "total_original_price"
    t.index ["attribute_value_id"], name: "index_order_products_on_attribute_value_id"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exhibition_id"
    t.integer "total_retail_sales"
    t.integer "total_wholesale_sales"
    t.integer "total_quantities"
    t.integer "rate"
    t.text "memo"
    t.integer "status", default: 0, null: false
    t.integer "censor", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "buyer_user_id"
    t.bigint "billing_user_address_id"
    t.bigint "shipping_user_address_id"
    t.index ["billing_user_address_id"], name: "index_orders_on_billing_user_address_id"
    t.index ["buyer_user_id"], name: "index_orders_on_buyer_user_id"
    t.index ["exhibition_id"], name: "index_orders_on_exhibition_id"
    t.index ["shipping_user_address_id"], name: "index_orders_on_shipping_user_address_id"
  end

  create_table "product_attribute_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_attribute_id"
    t.string "image"
    t.boolean "is_cover_image", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_attribute_id"], name: "index_product_attribute_images_on_product_attribute_id"
  end

  create_table "product_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "attribute_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_id"], name: "index_product_attributes_on_attribute_id"
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "image"
    t.boolean "is_cover_image", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_tags_on_product_id"
    t.index ["tag_id"], name: "index_product_tags_on_tag_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exhibition_id"
    t.string "name"
    t.string "product_no"
    t.integer "price"
    t.text "description"
    t.datetime "order_date"
    t.datetime "delivery_time"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_user_id"
    t.index ["brand_user_id"], name: "index_products_on_brand_user_id"
    t.index ["exhibition_id"], name: "index_products_on_exhibition_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "lastname"
    t.string "firstname"
    t.string "lastname_kana"
    t.string "firstname_kana"
    t.string "address"
    t.string "building_name"
    t.string "telephone"
    t.boolean "is_default_addr", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zipcode"
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.bigint "role_id"
    t.text "description"
    t.string "company_name"
    t.string "company_url"
    t.string "company_logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "store"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "attribute_values", "attributes"
  add_foreign_key "brand_buyers", "users", column: "brand_user_id"
  add_foreign_key "brand_buyers", "users", column: "buyer_user_id"
  add_foreign_key "company_images", "users"
  add_foreign_key "exhibitions", "users", column: "brand_user_id"
  add_foreign_key "order_products", "attribute_values"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "exhibitions"
  add_foreign_key "orders", "user_addresses", column: "billing_user_address_id"
  add_foreign_key "orders", "user_addresses", column: "shipping_user_address_id"
  add_foreign_key "orders", "users", column: "buyer_user_id"
  add_foreign_key "product_attribute_images", "product_attributes"
  add_foreign_key "product_attributes", "attributes"
  add_foreign_key "product_attributes", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "products", "exhibitions"
  add_foreign_key "products", "users", column: "brand_user_id"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "users", "roles"
end
