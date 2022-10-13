# frozen_string_literal: true

# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string           not null
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id  (likeable_type,likeable_id)
#  index_likes_on_user_id                        (user_id)
#
# Foreign Keys
#
#  fk_rails_1e09b5dabf  (user_id => users.id)
#

class LikeSerializer < ApplicationSerializer
  attributes(
    :user_id,
    :likeable_id
  )

  belongs_to :user, serializer: UserListSerializer
  belongs_to :likeable, polymorphic: true
end
