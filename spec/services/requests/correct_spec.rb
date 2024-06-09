# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_examples/requests_examples'

RSpec.describe Requests::Correct do
  subject(:service) do
    described_class.call(
      request_message:,
      chat:
    )
  end

  let!(:request_message) { build_stubbed(:message, :user, body: 'I do request yesterday') }
  let(:response_body) do
    {
      'correction' => 'I made a request yesterday.',
      'explanation' =>
        "The original sentence is incorrect because 'do request' is not the correct verb form for past tense. " \
        "The correct past tense form of 'request' is 'requested,' but in this context, 'made a request' is more natural.",
      'recommendations' => 'Practice using the past tense forms of verbs and familiarize yourself with common verb phrases.'
    }
  end
  let(:response_content) do
    "{\n  \"correction\": \"I made a request yesterday.\",\n  \"explanation\": \"" \
      "The original sentence is incorrect because 'do request' is not the correct verb form for past tense. " \
      "The correct past tense form of 'request' is 'requested,' but in this context, 'made a request' " \
      "is more natural.\",\n  \"recommendations\": \"" \
      "Practice using the past tense forms of verbs and familiarize yourself with common verb phrases.\"\n}"
  end

  it_behaves_like 'a request service', 'correction'
end
