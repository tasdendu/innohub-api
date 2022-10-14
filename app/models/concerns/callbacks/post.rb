# frozen_string_literal: true

module Callbacks
  module Post
    extend ActiveSupport::Concern

    included do
      after_create :broadcast_post
    end

    def broadcast_post
      PostJob.perform_async(id)
    end
  end
end
