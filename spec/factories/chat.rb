# frozen_string_literal: true

FactoryBot.define do
  sequence :chat_topic do |n|
    "topic#{n}"
  end
  factory :chat do
    topic { generate(:chat_topic) }
    account_learning_language
    main { false }

    trait :main do
      main { true }
    end
  end
end
