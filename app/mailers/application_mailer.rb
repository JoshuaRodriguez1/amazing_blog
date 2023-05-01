class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  prepend_view_path "app/views/mailers"
  layout "mailer"

  protected

  def admin
    # TODO: update the admin should have a rol
    @admin ||= User.first
  end
end
