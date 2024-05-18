# frozen_string_literal: true

# spec/factories/requests.rb

FactoryBot.define do
  factory :request do
    account
    request_message factory: %i[message]
    response_message factory: %i[message]
    action { 'translation' }
    prompt_tokens { 100 }
    completion_tokens { 50 }
    total_tokens { 150 }
    created_at { Time.current }
    updated_at { Time.current }

    trait :translation do
      action { 'translation' }
    end

    trait :correction do
      action { 'correction' }
    end
  end
end
