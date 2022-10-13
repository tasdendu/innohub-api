# frozen_string_literal: true

FactoryBot.define do
  factory :suggestion do
    user { nil }
    suggestable { nil }
  end
end
