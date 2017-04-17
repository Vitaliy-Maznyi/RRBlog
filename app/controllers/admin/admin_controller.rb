class Admin::AdminController < ApplicationController
  before_action :is_admin?

  private

  def is_admin?
    redirect_to(new_user_session_path) unless current_user.try(:is_admin?)
  end
end
