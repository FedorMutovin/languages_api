# frozen_string_literal: true

class ChatSerializer < Blueprinter::Base
  identifier :id
  fields :topic, :main
  view :with_messages do
    association :messages, blueprint: MessageSerializer
  end
end
