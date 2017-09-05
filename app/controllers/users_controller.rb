class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path, notice: "You're good to go, thanks for signing up."
    else
      render 'new'
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:name, :email, :password)
  end
end
