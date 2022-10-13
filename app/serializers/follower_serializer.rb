# frozen_string_literal: true

# == Schema Information
#
# Table name: followers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  club_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_followers_on_club_id  (club_id)
#  index_followers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_3d258d3942  (user_id => users.id)
#  fk_rails_e6125e9afb  (club_id => clubs.id)
#

class FollowerSerializer < ApplicationSerializer
  attributes(
    :user_id,
    :club_id
  )

  attribute :user do |object|
    UserListSerializer.new(object.user)
  end
end