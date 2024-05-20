# frozen_string_literal: true

FactoryBot.define do
  sequence :body do |n|
    "70#{n}"
  end
  FactoryBot.define do
    factory :message do
      body { generate(:body) }
      chat
      trait :user do
        assistant { false }
      end

      trait :assistant do
        assistant { true }
      end
    end
  end
end
