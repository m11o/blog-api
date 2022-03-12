# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_user_id  (user_id)
#
require "test_helper"

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
