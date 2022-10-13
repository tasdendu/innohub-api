# frozen_string_literal: true

class CommentForm < BaseForm
  def show
    comment
  end

  def create
    comment.save
  end

  def update
    comment.update(params)
  end

  delegate :destroy, to: :comment

  private

  def comment
    @comment ||= id ? Comment.find(id) : parent.comments.build(params.merge!(user: current_user))
  end
end
