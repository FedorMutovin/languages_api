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

ActiveRecord::Schema[7.1].define(version: 2024_05_19_145151) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_learning_languages", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current", default: false, null: false
    t.index ["account_id", "language_id"], name: "index_account_learning_languages_on_account_id_and_language_id", unique: true
    t.index ["account_id"], name: "index_account_learning_languages_on_account_id"
    t.index ["language_id"], name: "index_account_learning_languages_on_language_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "account_learning_language_id", null: false
    t.string "topic", null: false
    t.boolean "main", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_learning_language_id"], name: "index_chats_on_account_learning_language_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "locale", null: false
    t.boolean "for_learning", default: false, null: false
    t.boolean "for_interface", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locale"], name: "index_languages_on_locale", unique: true
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.text "body", null: false
    t.boolean "assistant", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "request_message_id", null: false
    t.bigint "response_message_id", null: false
    t.string "action", null: false
    t.integer "prompt_tokens", null: false
    t.integer "completion_tokens", null: false
    t.integer "total_tokens", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_requests_on_chat_id"
    t.index ["request_message_id"], name: "index_requests_on_request_message_id"
    t.index ["response_message_id"], name: "index_requests_on_response_message_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["language_id"], name: "index_users_on_language_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_learning_languages", "accounts"
  add_foreign_key "account_learning_languages", "languages"
  add_foreign_key "accounts", "users"
  add_foreign_key "chats", "account_learning_languages"
  add_foreign_key "messages", "chats"
  add_foreign_key "requests", "chats"
  add_foreign_key "requests", "messages", column: "request_message_id"
  add_foreign_key "requests", "messages", column: "response_message_id"
  add_foreign_key "users", "languages"
end
