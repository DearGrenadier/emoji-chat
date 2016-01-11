class MessagesController < ApplicationController
  include AuthorizeSessions

  before_action :authorize, only: [:index, :create]

  def index
    ActionCable.server.broadcast 'message_channel', message: {content: "@#{current_user} has joined to the room"}
    @messages = Message.last(10)
    render json: @messages, only: [:content, :author]
  end

  def create
    head :ok
  end
end
