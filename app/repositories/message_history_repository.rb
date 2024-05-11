# frozen_string_literal: true

class MessageHistoryRepository < ApplicationRepository
  def add_for_assistant(attrs)
    category = MessageHistoryCategoryRepository.new.assistant
    model.create!(attrs.merge(category:))
  end

  def find_assistant_history(account_id:)
    category = MessageHistoryCategoryRepository.new.assistant
    MessageHistory.joins(:language_assistant).where(category:, language_assistants: { account_id: }).first
  end
end
