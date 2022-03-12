# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string(255)      not null
#  crypted_password :string(255)
#  salt             :string(255)
#  name             :string(255)      default(""), not null
#  hostname         :string(255)      default(""), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
