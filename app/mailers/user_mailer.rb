class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_message.subject
  #
  def welcome_message(email)
    mail to: email, subject: 'Welcome to the Lunch and Learn Management System!'
  end
end
