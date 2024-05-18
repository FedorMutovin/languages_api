# frozen_string_literal: true

OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.openai.api_key
  config.organization_id = Rails.application.credentials.openai.org_id
  config.log_errors = true
end
