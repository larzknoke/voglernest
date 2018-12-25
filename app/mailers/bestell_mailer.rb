class BestellMailer < ApplicationMailer
  def bestell_email(bestellschein)
    @bestellschein = bestellschein
    @mailTo = Setting['mail_to_bst']
    mail(to: @mailTo, subject: "Brotbestellung für #{l(@bestellschein.datum, format: "%A, %d.%m.%Y")}")
  end
end
