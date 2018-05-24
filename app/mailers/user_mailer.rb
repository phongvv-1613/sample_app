class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t(".subject")
  end
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
=======

  def password_reset user
    @user = user
    mail to: user.email, subject: t(".subject")
  end
>>>>>>> Chapter 12
end
