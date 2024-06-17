# frozen_string_literal: true

class MessageRepository < ApplicationRepository
  def add_user_message(body:, chat:)
    add(body:, chat:, assistant: false)
  end

  def add_assistant_message(body:, chat:)
    add(body:, chat:, assistant: true)
  end
end
