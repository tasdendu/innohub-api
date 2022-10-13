# frozen_string_literal: true

class FollowerForm < BaseForm
  def show
    follower
  end

  def create
    follower.save
  end

  delegate :destroy, to: :follower

  private

  def follower
    @follower ||= id ? Follower.find(id) : parent.followers.find_or_initialize_by(user: current_user)
  end
end
