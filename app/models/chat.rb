# frozen_string_literal: true

class Chat < ApplicationRecord
  MAIN_TOPIC_NAME = 'main'

  has_many :messages, dependent: :destroy
  belongs_to :account_learning_language
  validates :main, :topic, presence: true
end
