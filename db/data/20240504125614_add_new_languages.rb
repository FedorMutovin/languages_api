# frozen_string_literal: true

class AddNewLanguages < ActiveRecord::Migration[7.1]
  NEW_LANGUAGES = %w[Spanish Italian French].freeze

  def up
    repo = LanguageRepository.new
    NEW_LANGUAGES.each { |language| repo.add(name: language) }
  end

  def down
    repo = LanguageRepository.new
    NEW_LANGUAGES.each { |language| repo.remove(name: language) }
  end
end
