# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#create_account' do
    let(:repo) { instance_double(AccountRepository) }
    let(:user) { build(:user) }

    before do
      allow(AccountRepository).to receive(:new).and_return(repo)
      allow(repo).to receive(:add).with(user:)
      user.save
    end

    it 'instantiates the AccountRepository' do
      expect(AccountRepository).to have_received(:new)
    end

    it 'adds the user to the repository' do
      expect(repo).to have_received(:add).with(user:)
    end
  end
end
