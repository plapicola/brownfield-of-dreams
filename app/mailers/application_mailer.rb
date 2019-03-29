# frozen_string_literal: true

# Mailer for sharing common mail functionality
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@brownfield.com'
  layout 'mailer'
end
