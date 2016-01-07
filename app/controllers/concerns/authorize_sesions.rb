module AuthorizeSessions
  extend ActiveSupport::Concern

  def current_user
    cookies.signed[:username]
  end

  def set_current_user(user = nil)
    cookies.signed[:username] = user
  end

  def authorize
    redirect_to root_path unless current_user
  end
end
