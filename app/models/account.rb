# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :account_learning_languages, dependent: :destroy
  has_many :learning_languages, through: :account_learning_languages, source: :language
  belongs_to :user
end
