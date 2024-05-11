# frozen_string_literal: true

FactoryBot.define do
  factory :message_history_category do
    trait :assistant do
      name { 'assistant' }
    end

    trait :topic do
      name { 'topic' }
    end
  end
end
