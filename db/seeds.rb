# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# User.find_or_create_by(
#   :name => "vogler",
#   :email => "larz.knoke@gmail.com") do |user|
#     user.password = "vogler123"
#   end

case Rails.env
when "development"

  User.find_or_create_by(
  :name => "Knoke",
  :vorname => "Lars",
  :strasse => "Mecklenburgerstr. 6",
  :plz => "37603",
  :ort => "Holzminden",
  :telefon => "123456",
  :gast => false,
  :admin => true,
  :email => "larz.knoke@gmail.com") do |user|
    user.password = "vogler"
  end

  Kategorie.create(name: 'Brötchen')
  Kategorie.create(name: 'Brot')
  Kategorie.create(name: 'Süße Brötchen & Kleingebäck')

  Produkt.create(name: 'Vollkorn', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Schinken 2 kg', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Mehrkorn', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Dinkeldampf', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Dinkel-Hafer', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Kürbisbrot', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Kartoffelknolle', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Heinrichs Kruste', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Ital. Landbrot', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Pane Rustico', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Gerster', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Roggenburger', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Sonnenburger', aktiv: true, ausverkauft: false, kategorie_id: 1, preis: 2)
  Produkt.create(name: 'Fladenbrot', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Dinkeltoast', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Dinkelmehrkorntoast', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Dinkelrosinensem.', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Weißmehlwecken', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Dinkel Mohn', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Dinkel Sesam', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Mehrkorn m. 550er', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Dinkel', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Müslistangen', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Hörnchen', aktiv: true, ausverkauft: false, kategorie_id: 2, preis: 2)
  Produkt.create(name: 'Croissants', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)
  Produkt.create(name: 'Kürbiskernbrötchen ', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)
  Produkt.create(name: 'Roggenbrötchen', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)
  Produkt.create(name: 'Weltmeisterbrötchen', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)
  Produkt.create(name: 'Dinkelvollkornbaguette', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)
  Produkt.create(name: 'Weißmehlbaguette Bio', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)
  Produkt.create(name: 'Kirschstreußel Dinkel', aktiv: true, ausverkauft: false, kategorie_id: 3, preis: 2)

  Openhour.create(tag: 'Dienstag', start: "15:00".to_time, ende: "18:00".to_time, spezial: false, geschlossen: false)
  Openhour.create(tag: 'Freitag', start: "09:00".to_time, ende: "18:00".to_time, spezial: false, geschlossen: false)
  Openhour.create(tag: 'Samstag', start: "07:00".to_time, ende: "13:00".to_time, spezial: false, geschlossen: false)
  Openhour.create(tag: 'Silvester', start: "07:00".to_time, ende: "13:00".to_time, spezial: true  , geschlossen: true)

when "production"

end
