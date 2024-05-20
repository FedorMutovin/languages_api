# frozen_string_literal: true

class Message < ApplicationRecord
  after_create :broadcast_message
  has_one :request,
          class_name: 'Request',
          foreign_key: 'request_message_id',
          dependent: :destroy,
          inverse_of: :request_message
  has_one :response,
          class_name: 'Request',
          foreign_key: 'response_message_id',
          dependent: :destroy,
          inverse_of: :response_message
  belongs_to :chat
  validates :body, presence: true

  private

  def broadcast_message
    MessagesChannel.broadcast_to(chat, { messages: MessageSerializer.render_as_json(self) })
  end
end
