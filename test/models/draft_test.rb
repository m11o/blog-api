# == Schema Information
#
# Table name: drafts
#
#  id         :bigint           not null, primary key
#  uid        :string(255)      default(""), not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_drafts_on_uid_and_user_id  (uid,user_id) UNIQUE
#  index_drafts_on_user_id          (user_id)
#
require "test_helper"

class DraftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
