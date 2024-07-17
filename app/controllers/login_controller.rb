class LoginController < ApplicationController
  before_action :require_no_user_logged_in!, except: %w[ logout ]

  def view
  end

  def authenticate
    user = User.find_by_username(user_params[:username])

    if user.present? && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "You have successfully logged in!"
    else
      flash.now[:notice] = "Invalid username/password!"
      render :view, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to login_url, notice: "You have logged out."
  end

  private
  def require_no_user_logged_in!
    redirect_to root_url, notice: "You're already logged in!" if Current.user.present?
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end