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
require "minitest/autorun"

class DraftTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test '保存時にuidが作成される' do
    draft = @user.drafts.new
    assert_equal draft.uid, ''
    assert draft.valid?
    assert_not_equal draft.uid, ''
  end

  test '生成されたuidがすでに存在している場合、再度生成する' do
    exist_draft = drafts(:one)
    mock = MiniTest::Mock.new
    mock.expect(:base36, exist_draft.uid, [10])
    mock.expect(:base36, SecureRandom.base36(10).upcase, [10])

    blk = ->(n) { mock.base36(n) }
    SecureRandom.stub(:base36, blk) do
      user = exist_draft.user
      draft = user.drafts.new
      assert_equal draft.uid, ''
      assert draft.valid?
      assert_mock mock
      assert_not_equal draft.uid, ''
    end
  end

  test 'すでにuidを保持していれば、uidを生成しない' do
    draft = @user.drafts.new
    generated_uid = SecureRandom.base36(10).upcase
    draft.uid = generated_uid

    assert_equal draft.uid, generated_uid
    assert draft.valid?
    assert_equal draft.uid, generated_uid
  end
end
