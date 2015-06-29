class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user && @user.persisted?

      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      session[:user_id] = @user.id 
      flash[:notice] = "成功從 Facebook 登入：）"
      redirect_to root_path
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:error] = "您未曾使用 Facebook 帳號註冊好時光，請重新註冊。謝謝：)"
      redirect_to new_user_registration_path
    end
  end
end

