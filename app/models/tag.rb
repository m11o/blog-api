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
class Tag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
