# frozen_string_literal: true

FactoryBot.define do
  factory :account_learning_language do
    language
    account
    current { true }
  end
end
