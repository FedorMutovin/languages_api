# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[7.1]
  LANGUAGES = %w[Russian English Polish].freeze

  def up
    repo = LanguageRepository.new
    LANGUAGES.each { |language| repo.add(name: language) }
  end

  def down
    repo = LanguageRepository.new
    LANGUAGES.each { |language| repo.remove(name: language) }
  end
end
