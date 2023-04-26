class HomeController < ApplicationController
  before_action :skip_verify_authorized!
  before_action :contact_form, only: %i[create]

  def index
  end

  def contact
  end

  def create    
    @contact_form.assign_attributes(contact_params)

    if @contact_form.valid?
      ContactMailer.form_sended(@contact_form.attributes).deliver_later

      flash[:notice] = "Thank you for your feedback"
    else
      flash[:alert] = "something went wrong"
    end

    redirect_to contact_path
  end

  private

  def contact_form
    @contact_form = ContactForm.new
  end

  def contact_params
    params.require(:contact).permit(:title, :content, :email)
  end
end
