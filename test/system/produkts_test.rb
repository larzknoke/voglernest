require "application_system_test_case"

class ProduktsTest < ApplicationSystemTestCase
  setup do
    @produkt = produkts(:one)
  end

  test "visiting the index" do
    visit produkts_url
    assert_selector "h1", text: "Produkts"
  end

  test "creating a Produkt" do
    visit produkts_url
    click_on "New Produkt"

    check "Aktiv" if @produkt.aktiv
    check "Ausverkauft" if @produkt.ausverkauft
    fill_in "Bestellposition", with: @produkt.bestellposition_id
    fill_in "Name", with: @produkt.name
    fill_in "Preis", with: @produkt.preis
    fill_in "Warenkorbposition", with: @produkt.warenkorbposition_id
    click_on "Create Produkt"

    assert_text "Produkt was successfully created"
    click_on "Back"
  end

  test "updating a Produkt" do
    visit produkts_url
    click_on "Edit", match: :first

    check "Aktiv" if @produkt.aktiv
    check "Ausverkauft" if @produkt.ausverkauft
    fill_in "Bestellposition", with: @produkt.bestellposition_id
    fill_in "Name", with: @produkt.name
    fill_in "Preis", with: @produkt.preis
    fill_in "Warenkorbposition", with: @produkt.warenkorbposition_id
    click_on "Update Produkt"

    assert_text "Produkt was successfully updated"
    click_on "Back"
  end

  test "destroying a Produkt" do
    visit produkts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produkt was successfully destroyed"
  end
end
