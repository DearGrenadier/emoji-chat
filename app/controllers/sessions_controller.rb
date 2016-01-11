class SessionsController < ApplicationController
  include AuthorizeSessions

  def new
    render 'layouts/application'
  end

  def create
    set_current_user(params[:session][:username])
    head :ok
  end

  def show
    render json: {username: current_user}
  end
end
