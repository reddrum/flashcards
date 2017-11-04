class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if login(login_params[:email], login_params[:password])
      redirect_back_or_to(root_path, notice: "Login successful")
    else
      flash.now[:alert] = "Login failed!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

    def login_params
      params.require(:user).permit(:email, :password)
    end
end
