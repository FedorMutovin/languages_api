# frozen_string_literal: true

module Api
  module V1
    class LanguagesController < ApplicationController
      def index
        render json: LanguageSerializer.render(LanguageRepository.new.all)
      end
    end
  end
end
