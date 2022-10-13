# frozen_string_literal: true

module Helpers
  module User
    extend ActiveSupport::Concern

    def login=(login)
      @login = login
    end

    def login
      @login || username || email || phone
    end

    def profile_photo_url
      profile_photo&.image&.url if profile_photo&.image&.attached?
    end

    def cover_photo_url
      cover_photo&.image&.url if cover_photo&.image&.attached?
    end
  end
end
