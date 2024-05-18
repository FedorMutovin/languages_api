# frozen_string_literal: true

module Api
  module V1
    module Public
      class LanguagesController < Api::V1::Public::BaseController
        def index
          languages = Rails.cache.fetch('languages') do
            LanguageRepository.new.all
          end
          render json: LanguageSerializer.render(languages)
        end
      end
    end
  end
end
