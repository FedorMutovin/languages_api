# frozen_string_literal: true

class ChatRepository < ApplicationRepository
  def add_main(attrs)
    add(attrs.merge(main: true, topic: Chat::MAIN_TOPIC_NAME))
  end

  def find_main(attrs)
    find_by(attrs.merge(main: true))
  end
end
