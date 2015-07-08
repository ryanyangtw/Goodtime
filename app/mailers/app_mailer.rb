class AppMailer < ActionMailer::Base
  default from: "girlstimegoodtime @gmail.com"

  def send_welcome_email(user)
    @user = user
    mail to: user.email, subject: "【 註冊成功】好時光歡迎妳的加入"
  end

  def send_forgot_password(user)
    @user = user
    mail to: user.email, subject: "【好時光密碼重設通知"
  end

  # def send_invitation_email(invitation)
  #   @invitation = invitation
  #   mail to: invitation.recipient_email, subject: "Invitation to join MyFlix"
  # end
end