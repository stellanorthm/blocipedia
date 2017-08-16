class UserMailer < ApplicationMailer
  default from: 'diego.a.mazzero@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://blocipedia.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Blocipedia!')
  end

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end


end
