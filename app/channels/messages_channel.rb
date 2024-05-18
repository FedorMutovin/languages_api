# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user.account

    messages = current_user.account.messages
    MessagesChannel.broadcast_to(current_user.account, { messages: MessageSerializer.render_as_json(messages) })
  end

  def receive(data)
    repo = MessageRepository.new
    request_message = repo.add_user_message(body: data['message']['message'], account: current_user.account)
    route_klass = Requests::Router.call(request: data['message']['request'])
    if data['message']['request'] == 'Translate'
      route_klass.constantize.call(
        request_message:,
        account: current_user.account,
        source_language: data['message']['source_language'],
        target_language: data['message']['target_language']
      )
    else
      route_klass.constantize.call(request_message:, account: current_user.account)
    end
  end
end
