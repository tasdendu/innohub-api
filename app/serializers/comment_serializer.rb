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

class CommentSerializer < ApplicationSerializer
  attributes(
    :body,
    :parent_id,
    :commentable_id,
    :user_id,
    :commented_at,
    :comments_count,
    :likes_count
  )

  attribute :likeable_id do |obj, params|
    obj.likes.find_by(user_id: params[:current_user].id)&.id
  end
  attribute :liked do |obj, params|
    obj.likes.pluck(:user_id).include?(params[:current_user].id)
  end

  belongs_to :commentable, polymorphic: true
  belongs_to :user, serializer: UserListSerializer

  has_many :children, key: :children_attributes, serializer: CommentListSerializer
end
