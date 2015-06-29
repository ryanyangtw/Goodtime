class ForgotPasswordsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.create_token!
      # AppMailer.send_forgot_password(user).deliver
      AppMailer.delay.send_forgot_password(user)
      redirect_to forgot_password_confirmation_path
    else
      flash[:error] = params[:email].blank? ? "Email 不能空白" : "此 Email 不存在於系統中，請從新輸入"
      redirect_to forgot_password_path
    end
  end

  # If we just render states page. We don't need to define method.
  # def confirm
  # end

end