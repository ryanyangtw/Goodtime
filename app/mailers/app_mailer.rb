class AppMailer < ActionMailer::Base
  default from: "girlstimegoodtime @gmail.com"

  def send_welcome_email(user)
    @user = user
    mail to: user.email, subject: "歡迎加入好時光：）"
  end

  def send_forgot_password(user)
    @user = user
    mail to: user.email, subject: "好時光-從新設置密碼"
  end

  # def send_invitation_email(invitation)
  #   @invitation = invitation
  #   mail to: invitation.recipient_email, subject: "Invitation to join MyFlix"
  # end
end