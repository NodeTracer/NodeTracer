class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_path, notice: "Signed in"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
