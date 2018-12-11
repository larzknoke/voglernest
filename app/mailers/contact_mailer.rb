class ContactMailer < ApplicationMailer
  def contact_email(message)
    @name = message.name
    @email = message.email
    @telefon = message.telefon
    @text = message.text
    mail(to: ENV["MAILTO"], subject: "Neue Nachricht Kontaktformular Voglerhof.de")
  end
end