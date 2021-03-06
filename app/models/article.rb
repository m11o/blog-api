# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  uid          :string(255)      default(""), not null
#  user_id      :bigint           not null
#  title        :string(255)      default(""), not null
#  description  :text(65535)
#  body         :text(16777215)
#  tags         :text(65535)
#  published_at :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_articles_on_uid_and_user_id  (uid,user_id) UNIQUE
#  index_articles_on_user_id          (user_id)
#
class Article < ApplicationRecord
  belongs_to :user

  validates :uid, presence: true, uniqueness: { scope: :user_id }, format: { with: Regexp.compile(Draft::UID_REGEXP) }
  validates :title, presence: true
  validates :published_at, presence: true
end
