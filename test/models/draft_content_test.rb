# == Schema Information
#
# Table name: draft_contents
#
#  id          :bigint           not null, primary key
#  draft_id    :bigint           not null
#  title       :string(255)      default(""), not null
#  description :text(65535)
#  body        :text(16777215)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_draft_contents_on_draft_id  (draft_id)
#
require "test_helper"

class DraftContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
