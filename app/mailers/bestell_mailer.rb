class BestellMailer < ApplicationMailer
  def bestell_email(bestellschein)
    @bestellschein = bestellschein
    mail(to: ENV["MAILTO"], subject: "Brotbestellung für #{l(@bestellschein.datum, format: "%A, %d.%m.%Y")}")
  end
end
