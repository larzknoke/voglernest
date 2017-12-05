# Preview all emails at http://localhost:3000/rails/mailers/bestell_mailer
class BestellMailerPreview < ActionMailer::Preview
  def bestell_email
    BestellMailer.bestell_email.deliver_later
  end
end
