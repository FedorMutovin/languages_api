# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :accounts_interfaces,
           class_name: 'Account',
           foreign_key: 'interface_language_id',
           dependent: :destroy,
           inverse_of: :language
  has_many :account_learning_languages, dependent: :destroy
  has_many :learning_accounts, through: :account_learning_languages, source: :account

  validates :name, presence: true, uniqueness: true
end
