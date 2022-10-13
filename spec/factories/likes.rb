# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    type { '' }
    likeable { nil }
    user { nil }
  end
end
