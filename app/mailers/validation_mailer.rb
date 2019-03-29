# frozen_string_literal: true

# Mailer for sending validation emails to new users
class ValidationMailer < ApplicationMailer
  def validate(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Brownfield!')
  end
end
