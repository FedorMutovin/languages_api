# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "hi#{n}@example.com"
  end
  factory :user do
    email { generate(:email) }
    password { SecureRandom.hex(10) }
    language_id { create(:language).id }
  end
end
