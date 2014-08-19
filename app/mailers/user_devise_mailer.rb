class UserDeviseMailer < Devise::Mailer
  layout 'mailer_responsive'
  default from: 'from@example.com'
end
