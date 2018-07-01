class AntwortMailer < ApplicationMailer
  def antwort_email(anfrage)
    @email = anfrage.email
    @startDate = anfrage.startDate
    @endDate = anfrage.endDate
    @gestellt_am = anfrage.created_at
    @anzahl = anfrage.anzahl
    @text = anfrage.antwort
    mail(to: @email, subject: "Antwort zu Ihrer Anfrage auf Voglerhof.de")
  end
end
