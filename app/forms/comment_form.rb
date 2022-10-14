# frozen_string_literal: true

class CommentForm < BaseForm
  def show
    comment
  end

  def create
    comment.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  def update
    comment.update(params)
  end

  delegate :destroy, to: :comment

  private

  def comment
    @comment ||= id ? Comment.find(id) : parent.comments.build(params.merge!(user: current_user))
  end

  def notification_attribute # rubocop:disable Metrics/AbcSize
    {
      title: comment.user.profile_photo_url,
      text: "<strong>#{comment.user.name}</strong> has commented on <strong>#{comment.commentable.user.name}" \
            "</strong>'s #{comment.commentable_type.downcase} '#{comment.commentable.try(:body)}'",
      path: "#{comment.commentable_type.downcase.pluralize}/#{comment.commentable_id}",
      recipient_ids: [comment.commentable.user_id]
    }
  end
end
