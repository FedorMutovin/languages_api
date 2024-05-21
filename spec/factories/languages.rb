# frozen_string_literal: true

FactoryBot.define do
  sequence :language_name do |n|
    "klingon#{n}"
  end

  sequence :language_locale do |n|
    "kl#{n}"
  end

  factory :language do
    name { generate(:language_name) }
    locale { generate(:language_locale) }
    for_learning { true }
    for_interface { true }

    trait :english do
      name { 'English' }
      locale { 'en' }
      for_learning { true }
      for_interface { true }
    end
  end
end
