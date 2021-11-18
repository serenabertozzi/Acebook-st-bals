class UserMailer < ActionMailer::Base
  default from: 'no-reply@eacebook.com'
  layout 'mailer'

  def forgot_password(user)
    @user = user
    @greeting = "Hi"
    
    mail to: user.email, :subject => 'Reset password instructions'
  end



end