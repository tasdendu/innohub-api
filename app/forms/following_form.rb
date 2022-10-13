# frozen_string_literal: true

class FollowingForm < BaseForm
  def show
    following
  end

  def create
    following.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  delegate :destroy, to: :following

  private

  def following
    @following ||= id ? Following.find(id) : parent.followings.find_or_initialize_by(user: current_user)
  end

  def notification_attribute
    {
      title: '',
      text: "<strong>#{following.user.name}</strong> is following <strong>#{following.followingable.name}" \
            '</strong>',
      path: "/#{following.followingable_type.downcase.pluralize}/#{following.followingable_id}",
      recipient_ids: [following.followingable.id]
    }
  end
end
