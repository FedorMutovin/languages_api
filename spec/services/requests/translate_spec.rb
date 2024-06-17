# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_examples/requests_examples'

RSpec.describe Requests::Translate do
  subject(:service) do
    described_class.call(
      request_message:,
      chat:,
      user:,
      source_language:,
      target_language:
    )
  end

  let!(:request_message) { build_stubbed(:message, :user, body: 'Honeymoon') }
  let(:response_body) { 'Медовый месяц' }
  let(:response_content) { '{"body": "Медовый месяц"}' }
  let(:source_language) { 'English' }
  let(:target_language) { 'Russian' }

  it_behaves_like 'a request service', 'translate'
end
