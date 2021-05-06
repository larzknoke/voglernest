require "application_system_test_case"

class BestellpositionsTest < ApplicationSystemTestCase
  setup do
    @bestellposition = bestellpositions(:one)
  end

  test "visiting the index" do
    visit bestellpositions_url
    assert_selector "h1", text: "Bestellpositions"
  end

  test "creating a Bestellposition" do
    visit bestellpositions_url
    click_on "New Bestellposition"

    fill_in "Bestellung", with: @bestellposition.bestellung_id
    fill_in "Menge", with: @bestellposition.menge
    fill_in "Preis", with: @bestellposition.preis
    click_on "Create Bestellposition"

    assert_text "Bestellposition was successfully created"
    click_on "Back"
  end

  test "updating a Bestellposition" do
    visit bestellpositions_url
    click_on "Edit", match: :first

    fill_in "Bestellung", with: @bestellposition.bestellung_id
    fill_in "Menge", with: @bestellposition.menge
    fill_in "Preis", with: @bestellposition.preis
    click_on "Update Bestellposition"

    assert_text "Bestellposition was successfully updated"
    click_on "Back"
  end

  test "destroying a Bestellposition" do
    visit bestellpositions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bestellposition was successfully destroyed"
  end
end
