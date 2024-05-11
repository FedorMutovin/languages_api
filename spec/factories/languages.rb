# frozen_string_literal: true

FactoryBot.define do
  factory :language do
    name { 'English' }
    locale { 'en' }
    for_learning { true }
    for_interface { true }
  end
end
