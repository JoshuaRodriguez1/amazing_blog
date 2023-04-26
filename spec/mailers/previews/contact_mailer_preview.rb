class ContactMailerPreview < ActionMailer::Preview
  def form_sended
    ContactMailer.form_sended({email: "sample@gmail.com", title: "sample", content: "some text"})
  end
end
