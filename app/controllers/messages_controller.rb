class MessagesController < ApplicationController
  include AuthorizeSessions

  before_action :authorize, only: [:index, :create]

  def index
    @current_user = current_user
    ActionCable.server.broadcast 'message_channel', message: "@#{current_user} has joined to the room"
  end

  def create
    head :ok
  end
end
