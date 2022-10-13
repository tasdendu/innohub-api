# frozen_string_literal: true

FactoryBot.define do
  factory :follower do
    user { nil }
    followable { nil }
  end
end
