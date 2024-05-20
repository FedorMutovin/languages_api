# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  before_subscribe :chat
  def subscribed
    stream_for @chat

    MessagesChannel.broadcast_to(@chat, { messages: MessageSerializer.render_as_json(@chat.messages) })
  end

  def receive(data)
    repo = MessageRepository.new
    request_message = repo.add_user_message(body: data['message'], chat:)
    route_klass = Requests::Router.call(request: data['request'])
    route_klass.constantize.call(
      request_message:,
      chat:,
      source_language: data['source_language'],
      target_language: data['target_language']
    )
  end

  private

  def chat
    @chat ||= find_chat
  end

  def find_chat
    account_learning_language = AccountLearningLanguageRepository.new.find_current(
      id: params[:account_learning_language_id],
      account: current_user.account
    )
    ChatRepository.new.find_main(account_learning_language:)
  end
end
