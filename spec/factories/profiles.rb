# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    name { 'MyString' }
    country { 'MyString' }
    state { 'MyString' }
    about { 'MyString' }
    social_links { 'MyString' }
  end
end
