# frozen_string_literal: true

class AccountLearningLanguage < ApplicationRecord
  after_create :create_main_chat
  has_many :chats, dependent: :destroy
  belongs_to :account
  belongs_to :language

  validates :current, presence: true
  validates :account_id, uniqueness: { scope: :language_id }

  private

  def create_main_chat
    repo = ChatRepository.new
    repo.add_main(account_learning_language: self)
  end
end
