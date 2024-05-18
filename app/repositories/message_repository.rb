# frozen_string_literal: true

class MessageRepository < ApplicationRepository
  def add_user_message(attrs)
    add(attrs.merge(assistant: false))
  end

  def add_assistant_message(attrs)
    add(attrs.merge(assistant: true))
  end
end
