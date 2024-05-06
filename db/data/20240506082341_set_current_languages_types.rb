# frozen_string_literal: true

class SetCurrentLanguagesTypes < ActiveRecord::Migration[7.1]
  LANGUAGES_TYPES = {
    "Russian": { for_interface: true, for_learning: false },
    "English": { for_interface: true, for_learning: true },
    "French": { for_interface: false, for_learning: false },
    "Spanish": { for_interface: false, for_learning: true },
    "Italian": { for_interface: false, for_learning: false },
    "Polish": { for_interface: true, for_learning: true },
  }.freeze

  def up
    repo = LanguageRepository.new
    LANGUAGES_TYPES.each do |language, types|
      repo.find_by(name: language).update(types)
    end
  end

  def down
    repo = LanguageRepository.new
    repo.where(name: LANGUAGES_WITH_LOCALES.keys).update(for_interface: false, for_learning: false)
  end
end
