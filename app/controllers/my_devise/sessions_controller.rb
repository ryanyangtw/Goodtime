class MyDevise::SessionsController < ApplicationController # Devise::SessionsController
# class SessionsController < ApplicationController

  def new
    # binding.pry
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.valid_password?(params[:password])
      # Copy from devise SessionsController
      # sign_in(resource_name, resource)
      session[:user_id] = @user.id
      redirect_to root_path, notice: '成功登入：）'
    else
      flash[:error] = "帳號或密碼錯誤"
      render :new
      # redirect_to new_user_session_path
    end
  end

  def destroy
    #binding.pry
    # Copy from devise SessionsController
    # Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    session[:user_id] = nil
    redirect_to root_path, notice: "成功登出：)"
  end
  
end
