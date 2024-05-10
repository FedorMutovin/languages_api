# frozen_string_literal: true

module Api
  module V1
    class LanguagesController < BasePublicController
      def index
        languages = Rails.cache.fetch('languages') do
          LanguageRepository.new.all
        end
        render json: LanguageSerializer.render(languages)
      end
    end
  end
end
