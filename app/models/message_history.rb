# frozen_string_literal: true

class MessageHistory < ApplicationRecord
  has_many :messages, dependent: :destroy, inverse_of: :history
  belongs_to :language_assistant
  belongs_to :category,
             class_name: 'MessageHistoryCategory',
             foreign_key: 'message_history_category_id',
             inverse_of: :message_histories
end
