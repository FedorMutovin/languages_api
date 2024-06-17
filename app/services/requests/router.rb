# frozen_string_literal: true

module Requests
  class Router < ApplicationService
    ROUTES = {
      'Translate' => 'Requests::Translate',
      'Correct' => 'Requests::Correct',
      'Explain' => 'Requests::Explain'
    }.freeze
    option :request

    def call
      ROUTES[request]
    end
  end
end
