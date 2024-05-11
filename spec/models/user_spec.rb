# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#create_account' do
    let(:user) { build(:user) }

    before do
      allow(Accounts::Setup).to receive(:call)
    end

    it 'creates an account' do
      user.save
      expect(Accounts::Setup).to have_received(:call)
    end
  end
end
