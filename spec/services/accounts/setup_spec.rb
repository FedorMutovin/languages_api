# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accounts::Setup do
  subject(:service) { described_class.call(user:) }

  let(:user) { create(:user) }

  before do
    User.skip_callback(:create, :after, :setup_account)
    create(:message_history_category, :assistant)
  end

  after do
    User.set_callback(:create, :after, :setup_account)
  end

  describe '#call' do
    it 'create an account' do
      expect { service }.to change(Account, :count).by(1)
    end

    it 'creates a language assistant' do
      expect { service }.to change(LanguageAssistant, :count).by(1)
    end

    it 'creates a message history' do
      expect { service }.to change(MessageHistory, :count).by(1)
    end

    it 'creates a welcome message for the language assistant' do
      expect { service }.to change(Message, :count).by(1)
    end
  end
end
