class BestellMailer < ApplicationMailer
  def bestell_email(bestellschein)
    @bestellschein = bestellschein
    @mailTo = ENV["BST_EMAIL"]
    mail(to: @mailTo, subject: "Brotbestellung für #{l(@bestellschein.datum, format: "%A, %d.%m.%Y")}")
  end
end
