def create_table_wrap(table_name, &block)
  create_table(table_name, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4") { |t| block.call(t) }
end

create_table_wrap :drafts do |t|
  t.string :uid, null: false, default: ''
  t.references :user, null: false

  t.index :uid, unique: true

  t.timestamps null: false
end

create_table_wrap :draft_contents do |t|
  t.references :draft, null: false
  t.string :title, null: false, default: ''
  t.text :description
  t.text :body, limit: 16777215

  t.timestamps null: false
end

create_table_wrap :articles do |t|
  t.string :uid, null: false, default: ''
  t.references :user, null: false
  t.string :title, null: false, default: ''
  t.text :description
  t.text :body, limit: 16777215
  t.text :tags
  t.datetime :published_at, null: false

  t.index :uid, unique: true

  t.timestamps null: false
end

create_table_wrap :releases do |t|
  t.references :draft, null: false
  t.references :article, null: false
  t.integer :state, null: false, default: 0, limit: 1

  t.timestamps null: false
end

create_table_wrap :tags do |t|
  t.references :user, null: false
  t.string :name, null: false, default: ''

  t.timestamps null: false
end

create_table_wrap :draft_tags do |t|
  t.references :draft, null: false
  t.references :tag, null: false
end
