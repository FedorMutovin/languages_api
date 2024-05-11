# frozen_string_literal: true

FactoryBot.define do
  sequence :number do |n|
    "70#{n}"
  end
  factory :account do
    user_id { create(:user).id }
  end
end
