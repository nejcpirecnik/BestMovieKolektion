class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'

  UserMailer.notify(User.first).deliver

  layout 'mailer'
end
