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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.string "uid", default: "", null: false
    t.bigint "user_id", null: false
    t.string "title", default: "", null: false
    t.text "description"
    t.text "body", size: :medium
    t.text "tags"
    t.datetime "published_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid", "user_id"], name: "index_articles_on_uid_and_user_id", unique: true
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "draft_contents", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "draft_id", null: false
    t.string "title", default: "", null: false
    t.text "description"
    t.text "body", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draft_id"], name: "index_draft_contents_on_draft_id"
  end

  create_table "draft_tags", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "draft_id", null: false
    t.bigint "tag_id", null: false
    t.index ["draft_id"], name: "index_draft_tags_on_draft_id"
    t.index ["tag_id"], name: "index_draft_tags_on_tag_id"
  end

  create_table "drafts", charset: "utf8mb4", force: :cascade do |t|
    t.string "uid", default: "", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid", "user_id"], name: "index_drafts_on_uid_and_user_id", unique: true
    t.index ["user_id"], name: "index_drafts_on_user_id"
  end

  create_table "releases", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "draft_id", null: false
    t.bigint "article_id", null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_releases_on_article_id"
    t.index ["draft_id"], name: "index_releases_on_draft_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", default: "", null: false
    t.string "hostname", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
