class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params) ? ( redirect_to profile_path ) : (render 'edit')
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
