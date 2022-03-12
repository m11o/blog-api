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
class Draft < ApplicationRecord
  UID_REGEXP = '\A[A-Z0-9]{10}\z'.freeze

  belongs_to :user
  has_many :releases

  validates :uid, presence: true, uniqueness: { scope: :user_id }, format: { with: Regexp.compile(UID_REGEXP) }

  before_validation :generate_uid, on: :create

  def released?
    releases.present? && releases.order(created_at: :desc).first.opened?
  end

  private

  def generate_uid
    return if uid.present?

    pre_uid = SecureRandom.base36(10).upcase
    return generate_uid if user.drafts.exists?(uid: pre_uid)

    self.uid = pre_uid
  end
end
