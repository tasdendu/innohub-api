# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string           not null
#  text             :text
#  type             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint           not null
#  parent_id        :integer
#  user_id          :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable_type_and_commentable_id  (commentable_type,commentable_id)
#  index_comments_on_user_id                              (user_id)
#
# Foreign Keys
#
#  fk_rails_03de2dc08c  (user_id => users.id)
#

class SuggestionSerializer < ApplicationSerializer
  attributes(
    :body,
    :parent_id,
    :suggestable_id,
    :suggestable_type,
    :user_id,
    :suggested_at,
    :suggestions_count
  )

  belongs_to :suggestable, polymorphic: true
  belongs_to :user, serializer: UserListSerializer

  has_many :children, serializer: SuggestionListSerializer
end