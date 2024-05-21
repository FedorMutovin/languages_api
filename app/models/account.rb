# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :account_learning_languages, dependent: :destroy
  has_many :learning_languages, through: :account_learning_languages, source: :language
  has_many :messages, dependent: :destroy
  has_many :requests, dependent: :destroy
  belongs_to :user
end
