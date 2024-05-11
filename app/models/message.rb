# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :history,
             class_name: 'MessageHistory',
             foreign_key: 'message_history_id',
             inverse_of: :messages
  validates :body, presence: true
end
