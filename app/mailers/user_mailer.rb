class UserMailer < ApplicationMailer

  def welcome_email(article)
    @article = article
    @url  = 'http://example.com/login'
    mail(to: 'zhuhuihui@gochinatv.com', subject: 'Welcome to My Awesome Site')
  end

end
