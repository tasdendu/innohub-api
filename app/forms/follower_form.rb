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
    @follower ||= if id
                    Follower.find(id)
                  else
                    parent.followers.find_or_initialize_by(user_id: params[:user_id] || current_user.id)
                  end
  end
end
