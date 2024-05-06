# frozen_string_literal: true

class SetLocalesForCurrentLanguages < ActiveRecord::Migration[7.1]
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
    LANGUAGES_WITH_LOCALES.each do |language, locale|
      repo.find_by(name: language).update(locale: locale)
    end
  end

  def down
    repo = LanguageRepository.new
    repo.where(name: LANGUAGES_WITH_LOCALES.keys).update(locale: nil)
  end
end
