# frozen_string_literal: true

class Language < ApplicationRecord
  after_commit :clear_cache

  has_many :users, dependent: :nullify
  has_many :account_learning_languages, dependent: :destroy
  has_many :learning_accounts, through: :account_learning_languages, source: :account

  validates :name, presence: true, uniqueness: true
  validates :locale, presence: true, uniqueness: true

  private

  def clear_cache
    Rails.cache.delete('languages')
  end
end
