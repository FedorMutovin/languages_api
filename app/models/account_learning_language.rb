# frozen_string_literal: true

class AccountLearningLanguage < ApplicationRecord
  belongs_to :account
  belongs_to :language

  validates :current, presence: true
end
