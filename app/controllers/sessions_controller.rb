class SessionsController < ApplicationController
  skip_authorization_check
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path, notice: "Log Out Works"
  end
end
