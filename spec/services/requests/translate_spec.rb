# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Requests::Translate do
  subject(:service) do
    described_class.call(
      request_message:,
      chat:,
      source_language:,
      target_language:
    )
  end

  let(:client) { instance_double(OpenAI::Client) }
  let(:message_repo) { instance_double(MessageRepository) }
  let(:request_repo) { instance_double(RequestRepository) }
  let(:chat) { build_stubbed(:chat, :main) }
  let!(:request_message) { build_stubbed(:message, :user, body: 'Honeymoon') }
  let(:response_message) { build_stubbed(:message, :assistant, body: 'Медовый месяц', chat:) }
  let(:request) { build_stubbed(:request, :translation) }
  let(:source_language) { 'English' }
  let(:target_language) { 'Russian' }
  let(:response) do
    {
      'choices' => [
        {
          'message' => {
            'content' => 'Медовый месяц'
          }
        }
      ],
      'usage' => {
        'prompt_tokens' => 2,
        'completion_tokens' => 3,
        'total_tokens' => 5
      }
    }
  end

  before do
    allow(OpenAI::Client).to receive(:new).and_return(client)
    allow(client).to receive(:chat).and_return(response)
    allow(MessageRepository).to receive(:new).and_return(message_repo)
    allow(message_repo).to receive(:add_assistant_message).and_return(response_message)
    allow(RequestRepository).to receive(:new).and_return(request_repo)
    allow(request_repo).to receive(:add).and_return(request)
  end

  describe '#call' do
    it 'initialize client' do
      service
      expect(OpenAI::Client).to have_received(:new)
    end

    it 'send response to the client chat' do
      service
      expect(client).to have_received(:chat)
    end

    it 'calls add_assistant_message for MessageRepository' do
      service
      expect(message_repo).to have_received(:add_assistant_message).with(
        body: 'Медовый месяц', chat:
      )
    end

    it 'calls add for RequestRepository' do
      service
      expect(request_repo).to have_received(:add).with(
        chat:,
        request_message:,
        response_message:,
        action: 'translation',
        prompt_tokens: 2,
        completion_tokens: 3,
        total_tokens: 5
      )
    end
  end
end
