class Admin::UsersController < Admin::AdminController
  def index
    @admin_user = User.all.order(:id)
  end

  def edit
    @admin_user = User.find(params[:id])
  end

  def update
    @admin_user = User.find(params[:id])
    if @admin_user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :is_admin?)
  end
end
