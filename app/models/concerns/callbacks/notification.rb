# frozen_string_literal: true

module Callbacks
  module Notification
    extend ActiveSupport::Concern

    included do
      after_create :broadcast_notification
    end

    def broadcast_notification
      NotificationJob.perform_async(id)
    end
  end
end
