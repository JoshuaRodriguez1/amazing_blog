class ContactMailer < ApplicationMailer
  def form_sended(data)
    @title = data[:title]
    @user_email = data[:email]
    @content = data[:content]

    mail(to: @admin)
  end
end
