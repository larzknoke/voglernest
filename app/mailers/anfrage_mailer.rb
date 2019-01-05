class AnfrageMailer < ApplicationMailer
  def anfrage_email(anfrage)
    @anfrage = anfrage
    @name = anfrage.name
    @email = anfrage.email
    @telefon = anfrage.telefon
    @anzahl = anfrage.anzahl
    @startDate = anfrage.startDate
    @endDate = anfrage.endDate
    @mailTo = Setting['mail_to_fewo']
    mail(to: @mailTo, subject: "Neue Anfrage für die Ferienwohnung - Voglerhof.de")
  end
end