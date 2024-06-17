# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_examples/requests_examples'

RSpec.describe Requests::Explain do
  subject(:service) do
    described_class.call(
      request_message:,
      chat:,
      user:
    )
  end

  let!(:request_message) { build_stubbed(:message, :user, body: 'What does it mean: Hello ?') }
  let(:response_body) { "The word 'Hello' is a common greeting" }
  let(:response_content) do
    "{\n  \"body\": \"The word 'Hello' is a common greeting\"}"
  end

  it_behaves_like 'a request service', 'explain'
end
