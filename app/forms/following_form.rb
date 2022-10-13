# frozen_string_literal: true

class FollowingForm < BaseForm
  def show
    following
  end

  def create
    following.save
  end

  delegate :destroy, to: :following

  private

  def following
    @following ||= id ? Following.find(id) : parent.followings.find_or_initialize_by(user: current_user)
  end
end
