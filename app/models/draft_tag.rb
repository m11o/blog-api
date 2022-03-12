# == Schema Information
#
# Table name: draft_tags
#
#  id       :bigint           not null, primary key
#  draft_id :bigint           not null
#  tag_id   :bigint           not null
#
# Indexes
#
#  index_draft_tags_on_draft_id  (draft_id)
#  index_draft_tags_on_tag_id    (tag_id)
#
class DraftTag < ApplicationRecord
end
