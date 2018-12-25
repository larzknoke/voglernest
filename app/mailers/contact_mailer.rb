class ContactMailer < ApplicationMailer
  def contact_email(message)
    @name = message.name
    @email = message.email
    @telefon = message.telefon
    @text = message.text
    @mailTo = Setting['mail_to_default']
    mail(to: @mailTo, subject: "Neue Nachricht Kontaktformular Voglerhof.de")
  end
end
