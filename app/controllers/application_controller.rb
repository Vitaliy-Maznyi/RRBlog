class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    redirect_to main_app.new_user_session_url
  end
end
