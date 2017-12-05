class BestellMailer < ApplicationMailer
  def bestell_email(bestellschein)
    @bestellschein = bestellschein
    @mailto = "larz.knoke@gmail.com"
    mail(to: @mailto, subject: "Brotbestellung für #{l(@bestellschein.datum, format: "%A, %d.%m.%Y")}")
  end
end
