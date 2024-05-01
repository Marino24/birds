class UserMailer < ApplicationMailer
  def sample_email(email, tema, vsebina)
    @vsebina = vsebina
    mail(to: email, subject: tema)
  end
end
