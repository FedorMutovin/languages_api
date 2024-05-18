# frozen_string_literal: true

require 'benchmark'

module Requests
  class Base < ApplicationService
    include Dry::Monads[:result, :do, :try]
    TEMPERATURE = 0.3

    option :request_message
    option :account

    def call
      time = Benchmark.realtime do
        @response = yield send_request(client)
      end
      Rails.logger.info("Time taken: #{time} seconds.")
      response_message = yield create_message(@response)
      yield save_request(response_message, @response)
      Success(response_message)
    end

    private

    def client
      OpenAI::Client.new
    end

    def send_request(client)
      options = {
        model:,
        messages:,
        max_tokens:,
        temperature: TEMPERATURE
      }
      Rails.logger.info("Options: #{options}")
      response = client.chat(parameters: options)
      Success(response)
    rescue Faraday::Error => e
      Rails.logger.debug e
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
      body = response.dig('choices', 0, 'message', 'content')
      message = MessageRepository.new.add_assistant_message(body:, account:)
      Success(message)
    end

    def save_request(response_message, response)
      usage_data = response['usage']
      repo = RequestRepository.new
      request = repo.add(request_attributes(response_message, usage_data))
      Success(request)
    end

    def request_attributes(response_message, usage_data)
      {
        account:,
        request_message:,
        response_message:,
        action:,
        prompt_tokens: usage_data['prompt_tokens'],
        completion_tokens: usage_data['completion_tokens'],
        total_tokens: usage_data['total_tokens']
      }
    end

    def action
      raise NotImplementedError
    end

    def system_content
      raise NotImplementedError
    end

    def user_content
      raise NotImplementedError
    end

    def model
      raise NotImplementedError
    end

    def max_tokens
      raise NotImplementedError
    end
  end
end
