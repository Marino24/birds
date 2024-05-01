class MailController < ApplicationController
  def new
    @email = params[:email]
  end

  def send_mail
    email = params[:email]
    tema = params[:tema]
    vsebina = params[:vsebina]

    UserMailer.sample_email(email: email, tema: tema, vsebina: vsebina).deliver

    redirect_to root_path, notice: "E-pošta uspešno poslana!"
  end
end
