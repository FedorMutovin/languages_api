# frozen_string_literal: true

class MessageHistoryCategoryRepository < ApplicationRepository
  def assistant
    model.find_by(name: 'assistant')
  end
end
