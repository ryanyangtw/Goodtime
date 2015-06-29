class PasswordResetsController < ApplicationController
  def show
    user = User.find_by(token: params[:id])
    if user
      @token = user.token
    else
      redirect_to expired_token_path
    end
    
  end

  def create
    user = User.find_by(token: params[:token])
    if user && user.update(password: params[:password], password_confirmation: params[:password])
      #user.update(password: params[:password])
      # user.password = params[:password]
      # user.generate_token
      # user.save
      user.destroy_token!
      flash[:notice] = "您的密碼已修改完畢，請用新的密碼重新登入"
      # redirect_to sign_in_path
      redirect_to new_user_session_path
    else
      redirect_to expired_token_path
    end
  end

  def expired_token; end
end