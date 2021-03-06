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

  Brottyp.create(name: 'Brötchen')
  Brottyp.create(name: 'Brot')
  Brottyp.create(name: 'Süße Brötchen & Kleingebäck')

  Brotsorte.create(name: 'Vollkorn', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Schinken 2 kg', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Mehrkorn', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Dinkeldampf', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Dinkel-Hafer', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Kürbisbrot', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Kartoffelknolle', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Heinrichs Kruste', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Ital. Landbrot', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Pane Rustico', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Gerster', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Roggenburger', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Sonnenburger', aktiv: true, ausverkauft: false, brottyp_id: 1)
  Brotsorte.create(name: 'Fladenbrot', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Dinkeltoast', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Dinkelmehrkorntoast', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Dinkelrosinensem.', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Weißmehlwecken', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Dinkel Mohn', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Dinkel Sesam', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Mehrkorn m. 550er', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Dinkel', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Müslistangen', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Hörnchen', aktiv: true, ausverkauft: false, brottyp_id: 2)
  Brotsorte.create(name: 'Croissants', aktiv: true, ausverkauft: false, brottyp_id: 3)
  Brotsorte.create(name: 'Kürbiskernbrötchen ', aktiv: true, ausverkauft: false, brottyp_id: 3)
  Brotsorte.create(name: 'Roggenbrötchen', aktiv: true, ausverkauft: false, brottyp_id: 3)
  Brotsorte.create(name: 'Weltmeisterbrötchen', aktiv: true, ausverkauft: false, brottyp_id: 3)
  Brotsorte.create(name: 'Dinkelvollkornbaguette', aktiv: true, ausverkauft: false, brottyp_id: 3)
  Brotsorte.create(name: 'Weißmehlbaguette Bio', aktiv: true, ausverkauft: false, brottyp_id: 3)
  Brotsorte.create(name: 'Kirschstreußel Dinkel', aktiv: true, ausverkauft: false, brottyp_id: 3)

  Openhour.create(tag: 'Dienstag', start: "15:00".to_time, ende: "18:00".to_time, spezial: false, geschlossen: false)
  Openhour.create(tag: 'Freitag', start: "09:00".to_time, ende: "18:00".to_time, spezial: false, geschlossen: false)
  Openhour.create(tag: 'Samstag', start: "07:00".to_time, ende: "13:00".to_time, spezial: false, geschlossen: false)
  Openhour.create(tag: 'Silvester', start: "07:00".to_time, ende: "13:00".to_time, spezial: true  , geschlossen: true)

when "production"

end
