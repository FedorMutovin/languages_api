module Api
  module V1
    class BasePublicController < BaseController
      skip_before_action :authenticate_user!
    end
  end
end
