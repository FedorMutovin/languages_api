# frozen_string_literal: true

RSpec.shared_examples 'a request service' do |action|
  let(:client) { instance_double(OpenAI::Client) }
  let(:message_repo) { instance_double(MessageRepository) }
  let(:request_repo) { instance_double(RequestRepository) }
  let(:chat) { build_stubbed(:chat, :main) }
  let(:response_message) { build_stubbed(:message, :assistant, body: response_body.to_json, chat:) }
  let(:request) { build_stubbed(:request, action.to_sym) }
  let(:response) do
    {
      'choices' => [
        {
          'message' => {
            'content' => response_content
          }
        }
      ],
      'usage' => {
        'prompt_tokens' => 1,
        'completion_tokens' => 3,
        'total_tokens' => 4
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
    it 'initializes the client' do
      service
      expect(OpenAI::Client).to have_received(:new)
    end

    it 'sends response to the client chat' do
      service
      expect(client).to have_received(:chat)
    end

    it 'calls add_assistant_message for MessageRepository' do
      service
      expect(message_repo).to have_received(:add_assistant_message).with(body: response_body, chat:)
    end

    it 'calls add for RequestRepository' do
      service
      expect(request_repo).to have_received(:add).with(
        chat:,
        request_message:,
        response_message:,
        action:,
        prompt_tokens: 1,
        completion_tokens: 3,
        total_tokens: 4
      )
    end
  end
end
