# frozen_string_literal: true

class MessageHistorySerializer < Blueprinter::Base
  identifier :id
  association :messages, blueprint: MessageSerializer
  view :extended do
    association :category, blueprint: MessageHistoryCategorySerializer
  end
end
