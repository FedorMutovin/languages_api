module Requests
  class Router < ApplicationService
    ROUTES = {
      'Translate' => 'Requests::Translate',
      'Correct' => 'Requests::Correct',
    }
    option :request

    def call
      ROUTES[request]
    end
  end
end