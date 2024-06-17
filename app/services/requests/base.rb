# frozen_string_literal: true

require 'benchmark'

module Requests
  class Base < ApplicationService
    include Dry::Monads[:result, :do, :try]
    TEMPERATURE = 0.3

    option :request_message
    option :chat
    option :user
    option :source_language, optional: true
    option :target_language, optional: true

    def call
      time = Benchmark.realtime do
        @response = yield send_request(client)
      end
      Rails.logger.info("chat_id: #{chat.id}: OpenAI response time: #{time} seconds with parameters: #{parameters}")
      response_message = yield create_message(@response)
      yield save_request(response_message, @response)
      Success(response_message)
    end

    private

    def client
      OpenAI::Client.new
    end

    def send_request(client)
      response = client.chat(parameters:)
      Success(response)
    rescue Faraday::Error => e
      Rails.logger.debug e
      Failure(e.message)
    end

    def messages
      [
        {
          role: 'system',
          content: system_content
        },
        {
          role: 'user',
          content: user_content
        }
      ]
    end

    def create_message(response)
      body = JSON.parse(response.dig('choices', 0, 'message', 'content'))
      message = MessageRepository.new.add_assistant_message(body: body['body'], chat:)
      Success(message)
    rescue JSON::ParserError => e
      Rails.logger.debug e
      Failure(e.message)
    end

    def save_request(response_message, response)
      usage_data = response['usage']
      repo = RequestRepository.new
      request = repo.add(request_attributes(response_message, usage_data))
      Success(request)
    end

    def request_attributes(response_message, usage_data)
      {
        chat:,
        request_message:,
        response_message:,
        action: self.class::ACTION,
        prompt_tokens: usage_data['prompt_tokens'],
        completion_tokens: usage_data['completion_tokens'],
        total_tokens: usage_data['total_tokens']
      }
    end

    def parameters
      {
        model: self.class::MODEL,
        messages:,
        max_tokens: self.class::MAX_TOKENS,
        temperature: TEMPERATURE,
        response_format: { type: 'json_object' }
      }
    end

    def system_content
      raise NotImplementedError
    end

    def user_content
      raise NotImplementedError
    end
  end
end
