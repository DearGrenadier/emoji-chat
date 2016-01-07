class SessionsController < ApplicationController
  include AuthorizeSessions

  def new
    set_current_user if current_user
  end

  def create
    set_current_user(params[:session][:username])
    redirect_to messages_path
  end
end
