# frozen_string_literal: true

module Relations
  module Follower
    extend ActiveSupport::Concern

    included do
      belongs_to :user, inverse_of: :followers
      belongs_to :club, inverse_of: :followers
    end
  end
end
