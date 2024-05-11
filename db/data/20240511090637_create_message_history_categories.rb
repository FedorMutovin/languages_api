# frozen_string_literal: true

class CreateMessageHistoryCategories < ActiveRecord::Migration[7.1]
  CATEGORIES = %w[assistant topic]
  def up
    repo = MessageHistoryCategoryRepository.new
    CATEGORIES.each do |category|
      repo.add(name: category)
    end
  end

  def down
    repo = MessageHistoryCategoryRepository.new
    repo.where(name: CATEGORIES).destroy_all
  end
end
