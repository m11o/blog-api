# == Schema Information
#
# Table name: releases
#
#  id         :bigint           not null, primary key
#  draft_id   :bigint           not null
#  article_id :bigint           not null
#  state      :integer          default("closed"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_releases_on_article_id  (article_id)
#  index_releases_on_draft_id    (draft_id)
#
require "test_helper"

class ReleaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
