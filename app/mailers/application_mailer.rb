class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  prepend_view_path "app/views/mailers"
  layout "mailer"

  protected

  def admin
    # TODO: make admin
    #@admin ||= User.find_by
  end
end
