# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[7.1]
  LANGUAGES_WITH_LOCALES = {
    "Russian": "ru",
    "English": "en",
    "French": "fr",
    "Spanish": "es",
    "Italian": "it",
    "Polish": "pl",
  }.freeze

  def up
    repo = LanguageRepository.new
    LANGUAGES_WITH_LOCALES.each { |name, locale| repo.add(name:, locale:) }
  end

  def down
    repo = LanguageRepository.new
    LANGUAGES_WITH_LOCALES.keys.each { |language| repo.where(name: language).destroy_all }
  end
end
