# frozen_string_literal: true

# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_book_id  (book_id)
#  index_likes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#

class LikeListSerializer < ApplicationSerializer
  attributes(
    :user_id,
    :likeable_id,
    :likeable_type
  )

  attribute :user do |object, params|
    UserListSerializer.new(object.user, params:)
  end
end
