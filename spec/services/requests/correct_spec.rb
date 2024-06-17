# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_examples/requests_examples'

RSpec.describe Requests::Correct do
  subject(:service) do
    described_class.call(
      request_message:,
      chat:,
      user:
    )
  end

  let!(:request_message) { build_stubbed(:message, :user, body: 'I do request yesterday') }
  let(:response_body) { 'I made a request yesterday.' }
  let(:response_content) do
    "{\n  \"body\": \"I made a request yesterday.\"}"
  end

  it_behaves_like 'a request service', 'correct'
end
