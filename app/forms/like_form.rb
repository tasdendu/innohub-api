# frozen_string_literal: true

class LikeForm < BaseForm
  def show
    like
  end

  def create
    like.save
  end

  delegate :destroy, to: :like

  private

  def like
    @like ||= id ? Like.find(id) : parent.likes.find_or_initialize_by(user: current_user)
  end
end
