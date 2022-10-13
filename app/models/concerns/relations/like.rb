# frozen_string_literal: true

module Relations
  module Like
    extend ActiveSupport::Concern

    included do
      belongs_to :likeable, polymorphic: true, counter_cache: true
      belongs_to :user, inverse_of: :likes
    end
  end
end
