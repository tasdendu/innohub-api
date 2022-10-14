# frozen_string_literal: true

class PostSerializer < ApplicationSerializer
  attributes(
    :title, :body, :kind, :enabled, :comments_count, :likes_count, :suggestions_count, :tag_list,
    :petitions_count, :created_at
  )

  attribute :liked do |obj, params|
    obj.likes.pluck(:user_id).include?(params[:current_user].id)
  end
  attribute :opinion_given do |obj, params|
    obj.opinions.pluck(:user_id).include?(params[:current_user].id)
  end
  attribute :petition_given do |obj, params|
    obj.petitions.pluck(:user_id).include?(params[:current_user].id)
  end
  attribute :photos do |obj|
    PhotoSerializer.new(obj.photos)
  end
  attribute :options do |obj|
    OptionSerializer.new(obj.options)
  end
  attribute :user do |obj|
    UserListSerializer.new(obj.user)
  end
end
