# frozen_string_literal: true

# spec/factories/requests.rb

FactoryBot.define do
  factory :request do
    chat
    request_message factory: %i[message]
    response_message factory: %i[message]
    action { 'translate' }
    prompt_tokens { 100 }
    completion_tokens { 50 }
    total_tokens { 150 }
    created_at { Time.current }
    updated_at { Time.current }

    trait :translate do
      action { 'translate' }
    end

    trait :correct do
      action { 'correct' }
    end

    trait :explain do
      action { 'explain' }
    end
  end
end
