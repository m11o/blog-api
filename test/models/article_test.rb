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
#  index_articles_on_uid      (uid) UNIQUE
#  index_articles_on_user_id  (user_id)
#
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
