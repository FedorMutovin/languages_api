# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :account_learning_languages, dependent: :destroy
  has_many :learning_languages, through: :account_learning_languages, source: :language
  has_one :language_assistant, dependent: :destroy
  belongs_to :user
end
