class Admin::AdminController < ApplicationController
  before_action :admin?

private

  def admin?
    redirect_to(new_user_session_path) unless current_user.try(:is_admin?)
  end
end
