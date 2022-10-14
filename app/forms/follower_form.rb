# frozen_string_literal: true

class FollowerForm < BaseForm
  def show
    follower
  end

  def create
    follower.save.tap do |res|
      res && create_notification(notification_attribute)
    end
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

  def notification_attribute # rubocop:disable Metrics/AbcSize
    {
      title: follower.user.profile_photo_url,
      text: "<strong>#{follower.user.name}</strong> is following " \
            "<strong>#{follower.followable.name}</strong>",
      path: "#{follower.followable_type.downcase.pluralize}/#{follower.followable_id}",
      recipient_ids: [follower.followable.user_id]
    }
  end
end
